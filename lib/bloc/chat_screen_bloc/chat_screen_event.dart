part of 'chat_screen_bloc.dart';

@immutable
@freezed
abstract class ChatScreenEvent with _$ChatScreenEvent {
  const factory ChatScreenEvent.requestMessageStream(
      String userId, String otherUserId) = _ChatScreenEventRequestStream;
  const factory ChatScreenEvent.sendMessage(Message msg) =
      _ChatScreenEventSendMessage;
  const factory ChatScreenEvent.markAsSeen(String messageId) =
      _ChatScreenEventMarkAsSeen;
  const factory ChatScreenEvent.cacheConversation(List<Message> messages) =
      _ChatScreenEventCache;
  const factory ChatScreenEvent.updateConversationData(
      Map<String, dynamic> data) = _ChatScreenEventUpdateConversation;
  const factory ChatScreenEvent.reactToMessage(Map<String, dynamic> data) =
      _ChatScreenEventReactMessage;
  const factory ChatScreenEvent.setReplyToMessage(Map<String, dynamic> data) =
      _ChatScreenEventReplyMessage;
  const factory ChatScreenEvent.deleteMessage(Map<String, dynamic> data) =
      _ChatScreenEventDeleteMessage;
  const factory ChatScreenEvent.updateConversationLastMessageSeenStatus(
      String uid) = _ChatScreenEventLastMessageSeen;
}
