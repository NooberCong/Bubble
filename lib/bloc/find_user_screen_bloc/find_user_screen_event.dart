part of 'find_user_screen_bloc.dart';

@immutable
@freezed
abstract class FindUserScreenEvent with _$FindUserScreenEvent {
  const factory FindUserScreenEvent.findUserByUID(String uid) =
      _FindUserScreenEventUID;
  const factory FindUserScreenEvent.random(String userId) =
      _FindUserScreenEventRandom;
  const factory FindUserScreenEvent.startConveration(
      User user, User otherUser) = _FindUserScreenEventStartConversation;
}
