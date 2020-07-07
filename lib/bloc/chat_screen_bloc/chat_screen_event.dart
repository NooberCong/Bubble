part of 'chat_screen_bloc.dart';

@immutable
@freezed
abstract class ChatScreenEvent with _$ChatScreenEvent {
  const factory ChatScreenEvent.requestMessageStream(
      String userId, String otherUserId) = _ChatScreenEventRequestStream;
  const factory ChatScreenEvent.sendMessage(Message msg) =
      _ChatScreenEventSendMessage;
  const factory ChatScreenEvent.popScreen(String uid) = _ChatScreenEventPop;
  const factory ChatScreenEvent.markAsSeen(String messageId) =
      _ChatScreenEventMarkAsSeen;
  const factory ChatScreenEvent.cacheConversation(List<Message> messages) =
      _ChatScreenEventCache;
  const factory ChatScreenEvent.updateConversationData(
      Map<String, dynamic> data) = _ChatScreenEventUpdateConversation;
}
