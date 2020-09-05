const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onMessageAdded = functions.firestore
  .document("rooms/{roomId}/messages/{messageId}")
  .onCreate((snap, context) => {
    const doc = snap.data();
    sendNotification(doc, context.params.roomId);
    return null;
  });

exports.onReaction = functions.firestore
  .document("rooms/{roomId}/messages/{messageId}")
  .onUpdate(async (change, context) => {
    const before = change.before.data();
    const after = change.after.data();
    const reactions = Object.keys(before.reactions);

    for (rct of reactions) {
      if (before.reactions[rct].length < after.reactions[rct].length) {
        const target_reaction =
          after.reactions[rct][after.reactions[rct].length - 1];
        const message_owner = await admin
          .firestore()
          .collection("users")
          .doc(after.idFrom)
          .get();
        if (
          message_owner.uid == target_reaction.uid ||
          !message_owner.data().token
        ) {
          return;
        }
        const reactor = await admin
          .firestore()
          .collection("users")
          .doc(target_reaction.uid)
          .get();
        send(
          target_reaction.username,
          `${target_reaction.username} reacted ${rct} to a message you sent`,
          message_owner.data().token,
          {
            otherUser: JSON.stringify(reactor.data()),
            roomId: context.params.roomId,
          }
        );
      }
    }
  });

exports.onUserStatusChanged = functions.database
  .ref("/status/{uid}")
  .onUpdate(async (change, context) => {
    // Get the data written to Realtime Database
    const eventStatus = change.after.val();

    // Then use other event data to create a reference to the
    // corresponding Firestore document.
    const userFirestoreRef = admin
      .firestore()
      .collection("users")
      .doc(context.params.uid);
    // It is likely that the Realtime Database change that triggered
    // this event has already been overwritten by a fast change in
    // online / offline status, so we'll re-read the current data
    // and compare the timestamps.
    const statusSnapshot = await change.after.ref.once("value");
    const status = statusSnapshot.val();
    // If the current timestamp for this data is newer than
    // the data that triggered this event, we exit this function.
    if (status.onlineStatusLastChanged > eventStatus.onlineStatusLastChanged) {
      return null;
    }

    if (eventStatus.state === "offline") {
      //If user if offline, go through all the joinedRooms and check if user is stilled marked as typing
      //if so, set it as false
      updateRoomTypingActivity(userFirestoreRef);
    }

    // ... and write it to Firestore.
    return userFirestoreRef.update({
      ...eventStatus,
      onlineStatusLastChanged: Date.now().toString(),
    });
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
    if (change.before.data().bio != change.after.data().bio) {
      updateUserConversationsBio(context.params.uid, change.after.data().bio);
    }
    return null;
  });

async function updateRoomTypingActivity(userRef) {
  const uid = userRef.id;
  const userDoc = await userRef.get();
  userDoc.data().joinedRooms.forEach(async (roomId) => {
    let roomDoc = await admin.firestore().collection("rooms").doc(roomId).get();
    let roomData = roomDoc.data();
    if (roomData.typing[uid] === true) {
      roomData.typing[uid] = false;
      roomDoc.ref.update({ typing: roomData.typing });
    }
  });
  return userDoc.ref.update({ joinedRooms: [] });
}

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

async function updateUserConversationsBio(uid, bio) {
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
        bio: bio,
      }),
    });
  });
}

async function sendNotification(messageDoc, roomId) {
  const receiver = await admin
    .firestore()
    .collection("users")
    .doc(messageDoc.idTo)
    .get();
  if (shouldSend(receiver, messageDoc, roomId)) {
    // Get info user from (sent)
    const sender = await admin
      .firestore()
      .collection("users")
      .doc(messageDoc.idFrom)
      .get();

    const senderConversation = await sender.ref
      .collection("conversations")
      .doc(roomId)
      .get();

    send(
      senderConversation.data().nicknames[sender.id],
      senderConversation.data().nicknames[sender.id] + parseMessage(messageDoc),
      receiver.data().token,
      { otherUser: JSON.stringify(sender.data()), roomId: roomId }
    );
  } else {
    return;
  }
}

function send(title, body, token, data = {}) {
  const payload = {
    notification: {
      title: title,
      body: body,
      badge: "1",
      sound: "notification.mp3",
    },
    data: {
      click_action: "FLUTTER_NOTIFICATION_CLICK",
      ...data,
    },
  };
  // Let push to the target device
  admin.messaging().sendToDevice(token, payload);
}

function shouldSend(receiver, message, roomId) {
  return (
    receiver.data().token &&
    !receiver.data().joinedRooms.includes(roomId) &&
    message.idFrom !== message.idTo &&
    !message.seen
  );
}

function parseMessage(doc) {
  if (doc.type === "MessageType.text" || doc.type === "MessageType.url") {
    return `${doc.referenceTo != null ? " replied" : ""}: ${doc.content}`;
  } else if (doc.type === "MessageType.image") {
    return " sent a photo";
  } else if (doc.type === "MessageType.gif") {
    return " sent a gif";
  } else {
    //Check if sticker is main emoji
    const parts = doc.content.split("/");
    const stickerName = parts[parts.length - 1].split("$SIZE$")[0];
    switch (stickerName) {
      case "like.svg":
        return ": 👍";
      case "poo.svg":
        return ": 💩";
      case "flower.svg":
        return ": 🌺";
      case "money.svg":
        return ": 💰";
      case "rose.svg":
        return ": 🌹";
      case "heart.svg":
        return ": ❤️";
      case "fire.svg":
        return ": 🔥";
      case "waving-hand.svg":
        return ": 👋";
      default:
        return " sent a sticker";
    }
  }
}
