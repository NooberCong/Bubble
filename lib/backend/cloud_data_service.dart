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
      final myUid = (params as ParamsID).id;
      final allUsers =
          (await store.collection("users").getDocuments()).documents;
      final knownUids = (await store
              .collection("users")
              .document(myUid)
              .collection("conversations")
              .getDocuments())
          .documents
          .map((data) => User.fromJson(json.decode(data["otherUser"] as String)
                  as Map<String, dynamic>)
              .uid)
          .toList();
      final validUsers = allUsers
          .map((e) => e.data)
          .where((element) =>
              element["uid"] != myUid && !knownUids.contains(element["uid"]))
          .toList();
      if (allUsers.isEmpty || validUsers.isEmpty) {
        return Left(CloudFailure("No valid user found"));
      }

      return Right(User.fromJson(_randomUser(validUsers)));
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
    try {
      final inputData = params as ParamsID;
      return Right(store
          .collection("rooms")
          .document(inputData.id)
          .collection("messages")
          .orderBy("timestamp", descending: true)
          .limit(10)
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
    final documentReference = store
        .collection('rooms')
        .document(getRoomIdFromUIDHashCode(
            data["idFrom"] as String, data["idTo"] as String))
        .collection("messages")
        .document(generateRandomNumString());
    return documentReference.setData(data);
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
  Future<Either<CloudFailure, void>> updateUserData(Params params) async {
    try {
      final inputData = (params as ParamsMap).data;
      final userId = inputData["uid"] as String;
      return Right(await store
          .collection("users")
          .document(userId)
          .updateData(inputData["data"] as Map<String, dynamic>));
    } on Exception catch (e) {
      return Left(CloudFailure(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, void>> addConversation(Params params) async {
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
        userConversationDoc.reference.setData({
          "otherUser": json.encode(otherUser.toJson()),
          "lastMessage": "You have just connected with ${otherUser.username}",
          "lastActive": DateTime.now().millisecondsSinceEpoch.toString(),
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
        });
      }
      return const Right(null);
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
}
