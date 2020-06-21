import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'chat_screen_event.dart';
part 'chat_screen_state.dart';
part 'chat_screen_bloc.freezed.dart';

@injectable
class ChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  ICloudDataService cloudDataService;

  ChatScreenBloc(this.cloudDataService);
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
        final chatRoomId = getRoomIdFromUIDHashCode(userId, otherUserId);
        final streamOrFailure = await cloudDataService
            .fetchConversationStream(Params.id(chatRoomId));
        yield streamOrFailure.fold(
            (error) => ChatScreenState.error(error.message),
            (stream) => ChatScreenState.loaded(stream));
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
    );
  }
}
