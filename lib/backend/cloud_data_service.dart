import 'dart:convert';
import 'dart:math';
import 'package:bubble/core/failures/failure.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/domain/entities/user_status.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ICloudDataService)
class CloudDataService implements ICloudDataService {
  final Firestore store;
  final FirebaseStorage storage;

  CloudDataService(this.store, this.storage);

  @override
  Future<Either<CloudFailure, void>> addMessage(Params params) async {
    try {
      final message = (params as ParamsMessage).message;
      final messageJsonData = message.toJson();
      if (message.type == MessageType.image) {
        //If message type is image change content from file path to storage path
        await _updateMessageContentToImageUrl(messageJsonData);
      }
      _updateConversationLastMessage(
          message, getRoomIdFromUIDHashCode(message.idFrom, message.idTo));
      return Right(await _saveMessageToCloud(messageJsonData));
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  Future _updateMessageContentToImageUrl(
      Map<String, dynamic> messageJsonData) async {
    messageJsonData["content"] =
        await _uploadPhoto(messageJsonData["content"] as String);
  }

  @override
  Future<Either<CloudFailure, void>> deleteChatHistory(Params params) {
    // TODO: implement deleteChatHistory
    throw UnimplementedError();
  }

  @override
  Future<Either<CloudFailure, void>> deleteMessage(Params params) async {
    try {
      final idMap = (params as ParamsMap).data;
      return Right(await store
          .collection("rooms")
          .document(idMap["roomId"] as String)
          .collection("messages")
          .document(idMap["messageId"] as String)
          .delete());
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, User>> fetchRandomUser(Params params) async {
    try {
      final allUsers =
          (await store.collection("users").getDocuments()).documents;
      if (allUsers.isEmpty) {
        return Left(CloudFailure("No user found"));
      }

      return Right(
          User.fromJson(_randomUser(allUsers.map((e) => e.data).toList()
              // validUsers
              )));
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  Map<String, dynamic> _randomUser(List<Map<String, dynamic>> usersFound) =>
      usersFound[Random().nextInt(usersFound.length)];

  @override
  Future<Either<CloudFailure, Stream>> fetchConverstionSnapShotsStream(
      Params params) async {
    try {
      final inputData = params as ParamsID;
      return Right(store
          .collection("users")
          .document(inputData.id)
          .collection("conversations")
          .orderBy("lastActive", descending: true)
          .snapshots());
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, Stream>> fetchConversationStream(
      Params params) async {
    final inputData = (params as ParamsMap).data;
    try {
      _markLastMessageInConversationSnapshotAsSeen(inputData);
      return Right(store
          .collection("rooms")
          .document(inputData["roomId"] as String)
          .collection("messages")
          .orderBy("timestamp", descending: true)
          .limit(inputData["limit"] as int)
          .snapshots());
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  Future<String> _uploadPhoto(String path) async {
    final fileName = generateRandomNumString();
    final reference = FirebaseStorage.instance.ref().child(fileName);
    final compressedFile = await FlutterNativeImage.compressImage(path);
    final uploadTask = reference.putFile(compressedFile);
    final storageTaskSnapshot = await uploadTask.onComplete;
    final imageUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return imageUrl as String;
  }

  Future<void> _saveMessageToCloud(Map<String, dynamic> data) {
    return store
        .collection('rooms')
        .document(getRoomIdFromUIDHashCode(
            data["idFrom"] as String, data["idTo"] as String))
        .collection("messages")
        .document(data["messageId"] as String)
        .setData(data);
  }

  @override
  Future<Either<CloudFailure, User>> fetchUserByUID(Params params) async {
    try {
      final inputData = params as ParamsID;
      final user = await store.collection("users").document(inputData.id).get();
      if (!user.exists) {
        return Left(CloudFailure("User does not exist"));
      }
      return Right(User.fromJson(user.data));
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, Map<String, dynamic>>> updateUserData(
      Params params) async {
    try {
      final inputData = (params as ParamsMap).data;
      final userId = inputData["uid"] as String;
      final updateData = inputData["data"] as Map<String, dynamic>;
      if (updateData.keys.contains("imageUrl")) {
        final uploadedImageUrl =
            await _uploadPhoto(inputData["imagePath"] as String);
        updateData["imageUrl"] = uploadedImageUrl;
      }
      await store.collection("users").document(userId).updateData(updateData);
      return Right(updateData);
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, Map<String, dynamic>>> addConversation(
      Params params) async {
    try {
      final inputData = (params as ParamsMap).data;
      final user = inputData["user"] as User;
      final otherUser = inputData["otherUser"] as User;
      final roomId = getRoomIdFromUIDHashCode(user.uid, otherUser.uid);
      final userConversationDoc = await store
          .collection("users")
          .document(user.uid)
          .collection("conversations")
          .document(roomId)
          .get();

      //If conversation is not present in user conversations, add it
      if (!userConversationDoc.exists) {
        await userConversationDoc.reference.setData({
          "otherUser": json.encode(otherUser.toJson()),
          "lastMessage": "You have just connected with ${otherUser.username}",
          "lastActive": DateTime.now().millisecondsSinceEpoch.toString(),
          //Check if user is chatting with him/herself and choose special nickname for that case
          "otherUserNickname":
              user.uid != otherUser.uid ? otherUser.username : "Just you",
          "userNickname": user.uid != otherUser.uid ? user.username : "You",
          "mainEmoji": "assets/images/like.svg",
          "themeColorCode": 4280391411,
          "fontFamily": "Roboto",
          "seen": false
        });
      }

      final otherUserConversationDoc = await store
          .collection("users")
          .document(otherUser.uid)
          .collection("conversations")
          .document(roomId)
          .get();

      //If conversation is not present in other user conversations, add it
      if (!otherUserConversationDoc.exists) {
        await otherUserConversationDoc.reference.setData({
          "otherUser": json.encode(user.toJson()),
          "lastMessage": "You have just connected with ${user.username}",
          "lastActive": DateTime.now().millisecondsSinceEpoch.toString(),
          "userNickname": otherUser.username,
          "otherUserNickname": user.username,
          "mainEmoji": "assets/images/like.svg",
          "themeColorCode": 4280391411,
          "fontFamily": "Roboto",
          "seen": false
        });
      }
      return Right({
        "initialData": (await userConversationDoc.reference.get()).data,
        "stream": userConversationDoc.reference.snapshots()
      });
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, Stream>> fetchUserStatusStream(
      Params params) async {
    try {
      final peerUid = (params as ParamsID).id;
      return Right(store
          .collection("users")
          .document(peerUid)
          .snapshots()
          .map((event) => UserStatus.fromJson(event.data)));
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, Stream>> fetchUserDetailsStream(
      Params params) async {
    try {
      final inputData = params as ParamsID;
      return Right(
          store.collection("users").document(inputData.id).snapshots());
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, void>> markMessageAsSeen(Params params) async {
    try {
      final inputData = (params as ParamsMap).data;
      await store
          .collection("rooms")
          .document(inputData["roomId"] as String)
          .collection("messages")
          .document(inputData["messageId"] as String)
          .updateData({"seen": true});
      return const Right(null);
    } on Exception {
      return Left(CloudFailure(""));
    }
  }

  Future<void> _markLastMessageInConversationSnapshotAsSeen(
      Map<String, dynamic> data) {
    return store
        .collection("users")
        .document(data["uid"] as String)
        .collection("conversations")
        .document(data["roomId"] as String)
        .updateData({"seen": true});
  }

  Future<void> _updateConversationLastMessage(
      Message message, String roomId) async {
    final userFromConversation = await store
        .collection("users")
        .document(message.idFrom)
        .collection("conversations")
        .document(roomId)
        .get();

    final userToConversation = await store
        .collection("users")
        .document(message.idTo)
        .collection("conversations")
        .document(roomId)
        .get();

    final batch = store.batch();

    if (_isNotOutdated(
        userFromConversation.data["lastActive"] as String, message.timestamp)) {
      batch.updateData(userFromConversation.reference, {
        "lastMessage": parseMessage(message),
        "lastActive": message.timestamp,
        "userSentLastMessage": true,
        "seen": true,
      });
    }

    if (_isNotOutdated(
            userToConversation["lastActive"] as String, message.timestamp) &&
        !_isSameUser(message)) {
      final userTo =
          await store.collection("users").document(message.idTo).get();
      batch.updateData(userToConversation.reference, {
        "lastMessage": parseMessage(message),
        "lastActive": message.timestamp,
        "userSentLastMessage": false,
        "seen": userTo.data["state"] == "online" &&
            userTo.data["chattingWith"] == message.idFrom,
      });
    }

    return batch.commit();
  }

  bool _isNotOutdated(String lastActiveTimestamp, String messageTimestamp) {
    return int.parse(lastActiveTimestamp) < int.parse(messageTimestamp);
  }

  String parseMessage(Message message) {
    if (message.type == MessageType.text) {
      return ": ${message.content}";
    } else if (message.type == MessageType.image) {
      return " sent a photo";
    } else if (message.type == MessageType.svg) {
      final svgFileName = message.content.split("/").last;
      switch (svgFileName) {
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
        case "fire.svg":
          return ": 🔥";
        case "waving-hand.svg":
          return ": 👋";
        default:
          return "";
      }
    } else {
      return " sent a sticker";
    }
  }

  bool _isSameUser(Message message) {
    return message.idFrom == message.idTo;
  }

  @override
  Future<Either<CloudFailure, void>> updateConversationData(
      Params params) async {
    try {
      final inputData = (params as ParamsMap).data;
      Map<String, dynamic> updateData =
          inputData["updateData"] as Map<String, dynamic>;
      final batch = store.batch();
      batch.updateData(
          store
              .collection("users")
              .document(inputData["userId"] as String)
              .collection("conversations")
              .document(inputData["roomId"] as String),
          updateData);
      //Check if user is chatting with him/herself
      if (inputData["merge"] as bool) {
        //handle special case: update user nickname
        if (updateData.containsKey("userNickname") ||
            updateData.containsKey("otherUserNickname")) {
          updateData = _switchNicknameSides(updateData);
        }
        batch.updateData(
            store
                .collection("users")
                .document(inputData["otherUserId"] as String)
                .collection("conversations")
                .document(inputData["roomId"] as String),
            updateData);
      }
      await batch.commit();
      return const Right(null);
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  //Non-contract functions
  Future<Either<CloudFailure, DocumentSnapshot>> fetchConversationData(
      Params params) async {
    try {
      final inputData = (params as ParamsMap).data;
      final document = await store
          .collection("users")
          .document(inputData["userId"] as String)
          .collection("conversations")
          .document(inputData["roomId"] as String)
          .get();
      return Right(document);
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, List<String>>> fetchConversationPhotos(
      Params params) async {
    try {
      final inputData = (params as ParamsMap).data;
      final photosQuery = await store
          .collection("rooms")
          .document(inputData["roomId"] as String)
          .collection("messages")
          .where("type", isEqualTo: "MessageType.image")
          .orderBy("timestamp", descending: true)
          .limit(inputData["limit"] as int)
          .getDocuments();
      return Right(photosQuery.documents
          .map((doc) => doc.data["content"] as String)
          .toList());
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  Map<String, dynamic> _switchNicknameSides(Map<String, dynamic> updateData) {
    final modifiedData = <String, dynamic>{};
    final originalUserNickname = updateData["userNickname"];
    final originalOtherUserNickname = updateData["otherUserNickname"];
    if (originalUserNickname != null) {
      modifiedData["otherUserNickname"] = originalUserNickname;
    }
    if (originalOtherUserNickname != null) {
      modifiedData["userNickname"] = originalOtherUserNickname;
    }
    return updateData..addAll(modifiedData);
  }
}
