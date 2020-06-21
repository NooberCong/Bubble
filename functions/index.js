const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onMessageAdded = functions.firestore
  .document("rooms/{roomId}/messages/{messageId}")
  .onCreate((snap, context) => {
    console.log("----------------start function--------------------");

    const doc = snap.data();

    updateConversationLastMessage(doc, context.params.roomId);
    sendNotification(doc);
    return null;
  });

exports.onUserStatusChanged = functions.database
  .ref("/status/{uid}")
  .onUpdate(async (change, context) => {
    // Get the data written to Realtime Database
    const eventStatus = change.after.val();

    // Then use other event data to create a reference to the
    // corresponding Firestore document.
    const userStatusFirestoreRef = admin
      .firestore()
      .collection("users")
      .doc(context.params.uid);
    // It is likely that the Realtime Database change that triggered
    // this event has already been overwritten by a fast change in
    // online / offline status, so we'll re-read the current data
    // and compare the timestamps.
    const statusSnapshot = await change.after.ref.once("value");
    const status = statusSnapshot.val();
    console.log(status, eventStatus);
    // If the current timestamp for this data is newer than
    // the data that triggered this event, we exit this function.
    if (status.last_changed > eventStatus.last_changed) {
      return null;
    }

    // ... and write it to Firestore.
    return userStatusFirestoreRef.update(eventStatus);
  });

function sendNotification(doc) {
  admin
    .firestore()
    .collection("users")
    .doc(doc.idTo)
    .get()
    .then((userTo) => {
      if (userTo.data().token && userTo.data().chattingWith !== doc.idfrom) {
        // Get info user from (sent)
        admin
          .firestore()
          .collection("users")
          .doc(doc.idFrom)
          .get()
          .then((userFrom) => {
            const payload = {
              notification: {
                title: `You have a message from ${userFrom.data().name}`,
                body: doc.content,
                badge: "1",
                sound: "default",
              },
              data: {
                click_action: "FLUTTER_NOTIFICATION_CLICK",
                sound: "default",
                status: "done",
                roomId: "screenA",
              },
            };
            // Let push to the target device
            admin
              .messaging()
              .sendToDevice(userTo.data().token, payload)
              .then((response) => {
                console.log("Successfully sent message:", response);
              })
              .catch((error) => {
                console.log("Error sending message:", error);
              });
          });
      } else {
        console.log("Can not find pushToken target user");
      }
    });
}

async function updateConversationLastMessage(doc, roomId) {
  const userFromConversation = await admin
    .firestore()
    .collection("users")
    .doc(doc.idFrom)
    .collection("conversations")
    .doc(roomId)
    .get();

  const userToConversation = await admin
    .firestore()
    .collection("users")
    .doc(doc.idTo)
    .collection("conversations")
    .doc(roomId)
    .get();

  const batch = admin.firestore().batch();

  if (userFromConversation.data().lastActive < doc.timestamp) {
    batch.update(userFromConversation.ref, {
      lastMessage: parseMessage(doc),
      lastActive: doc.timestamp,
      userSentLastMessage: true,
    });
  }

  if (userFromConversation.data().lastActive < doc.timestamp) {
    batch.update(userToConversation.ref, {
      lastMessage: parseMessage(doc),
      lastActive: doc.timestamp,
      userSentLastMessage: false,
    });
  }

  return batch.commit();
}

function parseMessage(doc) {
  if (doc.type === "MessageType.text") {
    return `: ${doc.content}`;
  } else if (doc.type === "MessageType.image") {
    return " sent a photo";
  } else {
    if (doc.content === "assets/images/like.svg") {
      return ": 👍";
    }
    return " sent a sticker";
  }
}
