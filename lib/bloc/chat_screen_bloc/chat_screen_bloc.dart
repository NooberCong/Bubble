import 'dart:async';
import 'dart:convert';
import 'dart:math' show min;

import 'package:bloc/bloc.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'chat_screen_event.dart';
part 'chat_screen_state.dart';
part 'chat_screen_bloc.freezed.dart';

@injectable
class ChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  final ICloudDataService cloudDataService;
  final SharedPreferences sharedPreferences;
  final String chatRoomId;
  List<Message> cachedConversation;
  ChatScreenBloc(
    this.cloudDataService,
    this.sharedPreferences,
    @factoryParam this.chatRoomId,
  ) : cachedConversation =
            _getCachedConversationData(chatRoomId, sharedPreferences);
  int _snapshotLimit = 20;
  bool _endOfCollectionReached = false;

  @override
  ChatScreenState get initialState => const ChatScreenState.initial();

  @override
  Stream<ChatScreenState> mapEventToState(
    ChatScreenEvent event,
  ) async* {
    yield* event.when(
      requestMessageStream: (userId, otherUserId) async* {
        yield const ChatScreenState.loading();
        await cloudDataService.updateUserData(Params.map({
          "uid": userId,
          "data": {"chattingWith": otherUserId}
        }));
        final streamOrFailure = await cloudDataService.fetchConversationStream(
            Params.map({
          "limit": _snapshotLimit,
          "roomId": chatRoomId,
          "uid": userId
        }));
        yield* streamOrFailure.fold((error) async* {
          yield ChatScreenState.notification(error.message);
        }, (stream) async* {
          if (await allMessagesAreLoaded(stream)) {
            _endOfCollectionReached = true;
          } else {
            _increaseLimit();
          }
          yield ChatScreenState.loaded(
              stream.asyncMap((snapshot) => (snapshot as QuerySnapshot)
                  .documents
                  .map((doc) => Message.fromJson(doc.data))
                  .toList()),
              _endOfCollectionReached);
        });
      },
      sendMessage: (Message msg) async* {
        final sentOrFailure =
            await cloudDataService.addMessage(Params.message(msg));
        yield sentOrFailure.fold(
            (error) =>
                const ChatScreenState.notification("Message could not be sent"),
            (_) => const ChatScreenState.messageSent());
      },
      popScreen: (uid) async* {
        await cloudDataService.updateUserData(Params.map({
          "uid": uid,
          "data": {"chattingWith": ""}
        }));
      },
      markAsSeen: (String messageId) async* {
        cloudDataService.markMessageAsSeen(
            Params.map({"messageId": messageId, "roomId": chatRoomId}));
      },
      cacheConversation: (List<Message> messages) async* {
        cachedConversation = messages;
        _cacheConversationData(messages);
      },
      updateConversationData: (Map<String, dynamic> data) async* {
        yield const ChatScreenState.processing();
        final updateResult = await cloudDataService.updateConversationData(
            Params.map(data..addAll({"roomId": chatRoomId})));
        yield updateResult.fold(
            (error) =>
                const ChatScreenState.notification("Update operation failed"),
            (success) => const ChatScreenState.notification(
                "Update operation succeeded"));
      },
    );
  }

  int _increaseLimit() => _snapshotLimit += 20;

  Future<bool> allMessagesAreLoaded(Stream stream) async {
    return (await stream.first as QuerySnapshot).documents.length <
        _snapshotLimit;
  }

  static List<Message> _getCachedConversationData(
      String roomId, SharedPreferences preferences) {
    final cachedData = preferences.getString(roomId);
    return cachedData != null
        ? (json.decode(cachedData) as List<dynamic>)
            .map((e) => Message.fromJson(e as Map<String, dynamic>))
            .toList()
        : [];
  }

  void _cacheConversationData(List<Message> messages) {
    sharedPreferences.setString(
        chatRoomId, json.encode(messages.sublist(0, min(20, messages.length))));
  }
}
