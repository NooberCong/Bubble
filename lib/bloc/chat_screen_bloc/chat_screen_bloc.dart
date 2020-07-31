import 'dart:async';
import 'dart:convert';
import 'dart:math' show min;

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
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
  final AssetsAudioPlayer audioPlayer;
  List<Message> cachedConversation;
  ChatScreenBloc(
    this.cloudDataService,
    this.sharedPreferences,
    this.audioPlayer,
    @factoryParam this.chatRoomId,
  ) : cachedConversation =
            _getCachedConversationData(chatRoomId, sharedPreferences);
  int _snapshotLimit = 20;
  //Keep track of how many messages left to be sent to overflow the current snapshot limit
  int _messagesLeftTillOverLimit = -1;

  @override
  ChatScreenState get initialState => const ChatScreenState.initial();

  @override
  Stream<ChatScreenState> mapEventToState(
    ChatScreenEvent event,
  ) async* {
    yield* event.when(
      requestMessageStream: (userId, otherUserId) async* {
        yield const ChatScreenState.loading();
        final streamOrFailure = await cloudDataService.fetchConversationStream(
            Params.map({
          "limit": _snapshotLimit,
          "roomId": chatRoomId,
          "uid": userId
        }));
        yield* streamOrFailure.fold((error) async* {
          yield ChatScreenState.notification(error.message);
        }, (stream) async* {
          final queryLength = await _getQueryLength(stream);
          if (_endOfCollectionReached(queryLength)) {
            _messagesLeftTillOverLimit = _snapshotLimit - queryLength;
            yield const ChatScreenState.streamStateUpdate(false);
          } else {
            _increaseLimit();
          }
          yield ChatScreenState.loaded(stream.map((snapshot) =>
              (snapshot as QuerySnapshot)
                  .documents
                  .map((doc) =>
                      Message.fromJson(doc.data)..messageId = doc.documentID)
                  .toList()));
        });
      },
      sendMessage: (Message msg) async* {
        _playAudio(audioPlayer);
        final sentOrFailure =
            await cloudDataService.addMessage(Params.message(msg));
        yield* sentOrFailure.fold((error) async* {
          yield const ChatScreenState.notification("Message could not be sent");
        }, (_) async* {
          if (_messagesLeftTillOverLimit >= 0) {
            _messagesLeftTillOverLimit -= 1;
            if (_messagesLeftTillOverLimit < 0) {
              yield const ChatScreenState.streamStateUpdate(true);
            }
          }
          yield const ChatScreenState.messageSent();
        });
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
      reactToMessage: (Map<String, dynamic> data) async* {
        yield* _executeAndNotify(data, cloudDataService.reactToMessage,
            "Could not react to message");
      },
      setReplyToMessage: (Map<String, dynamic> data) async* {
        yield const ChatScreenState.processing();
        yield ChatScreenState.replying(data);
      },
      deleteMessage: (Map<String, dynamic> data) async* {
        yield* _executeAndNotify(
            data, cloudDataService.deleteMessage, "Could not delete message");
      },
    );
  }

  Future<void> _playAudio(AssetsAudioPlayer player) async {
    //Maybe implemented in a seperate class later if needed be
    final audioIsPlaying = await player.isPlaying.first;
    if (audioIsPlaying) {
      player.stop();
    }
    await player.open(Audio("assets/sounds/send_message.mp3"), volume: 100);
    return;
  }

  Stream<ChatScreenState> _executeAndNotify(Map<String, dynamic> data,
      Future<Either> Function(Params) execute, String failureMessage) async* {
    yield const ChatScreenState.processing();
    final executionResult = await execute(Params.map(data));
    if (executionResult.isLeft()) {
      yield ChatScreenState.notification(failureMessage);
    }
  }

  int _increaseLimit() => _snapshotLimit += 20;

  Future<int> _getQueryLength(Stream stream) async {
    return (await stream.first as QuerySnapshot).documents.length;
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

  bool _endOfCollectionReached(int queryLength) {
    return queryLength < _snapshotLimit;
  }
}
