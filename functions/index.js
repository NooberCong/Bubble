const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onMessageAdded = functions.firestore
  .document("rooms/{roomId}/messages/{messageId}")
  .onCreate((snap, context) => {
    console.log("----------------start function--------------------");

    const doc = snap.data();

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

exports.onUserDataChange = functions.firestore
  .document("users/{uid}")
  .onUpdate((change, context) => {
    if (change.before.data().imageUrl != change.after.data().imageUrl) {
      updateUserConversationsAvatar(
        context.params.uid,
        change.after.data().imageUrl
      );
    }
    return null;
  });

async function updateUserConversationsAvatar(uid, imageUrl) {
  const userConversations = await admin
    .firestore()
    .collection("users")
    .doc(uid)
    .collection("conversations")
    .get();
  userConversations.forEach(async (doc) => {
    const otherUserConversationSnapshot = await admin
      .firestore()
      .collection("users")
      .doc(JSON.parse(doc.data().otherUser).uid)
      .collection("conversations")
      .doc(doc.id)
      .get();
    otherUserConversationSnapshot.ref.update({
      otherUser: JSON.stringify({
        ...JSON.parse(otherUserConversationSnapshot.data().otherUser),
        imageUrl: imageUrl,
      }),
    });
  });
}

function sendNotification(doc) {
  admin
    .firestore()
    .collection("users")
    .doc(doc.idTo)
    .get()
    .then((userTo) => {
      if (userTo.data().token && userTo.data().chattingWith !== doc.idFrom) {
        // Get info user from (sent)
        admin
          .firestore()
          .collection("users")
          .doc(doc.idFrom)
          .get()
          .then((userFrom) => {
            const payload = {
              notification: {
                title: userFrom.data().name,
                body: userFrom.data().name + parseMessage(doc),
                badge: "1",
                sound: "default",
              },
              data: {
                click_action: "FLUTTER_NOTIFICATION_CLICK",
                sound: "default",
                status: "done",
                otherUser: JSON.stringify(userFrom.data()),
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

function parseMessage(doc) {
  if (doc.type === "MessageType.text") {
    return `: ${doc.content}`;
  } else if (doc.type === "MessageType.image") {
    return " sent a photo";
  } else {
    //Check if sticker is like button
    if (doc.content === "assets/images/like.svg") {
      return ": 👍";
    }
    return " sent a sticker";
  }
}
