part of 'chat_screen_bloc.dart';

@immutable
@freezed
abstract class ChatScreenState with _$ChatScreenState {
  const factory ChatScreenState.initial() = _ChatScreenStateInitial;
  const factory ChatScreenState.loaded(Stream messageStream, bool hasMore) =
      _ChatScreenStateLoaded;
  const factory ChatScreenState.notification(String message) =
      ChatScreenStateNotification;
  const factory ChatScreenState.messageSent() = _ChatScreenStateMessageSent;
  const factory ChatScreenState.loading() = _ChatScreenStateLoading;
}
