part of 'chat_screen_bloc.dart';

@immutable
@freezed
abstract class ChatScreenEvent with _$ChatScreenEvent {
  const factory ChatScreenEvent.requestMessageStream(
      String userId, String otherUserId) = _ChatScreenEventRequestStream;
  const factory ChatScreenEvent.sendMessage(Message msg) =
      _ChatScreenEventSendMessage;
  const factory ChatScreenEvent.popScreen(String uid) = _ChatScreenEventPop;
}
