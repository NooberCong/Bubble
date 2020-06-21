part of 'user_status_ball_bloc.dart';

@immutable
@freezed
abstract class UserStatusBallEvent with _$UserStatusBallEvent {
  const factory UserStatusBallEvent.requestPeerStatus(String uid) =
      _UserStatusBallEventRequestPeerStatus;
}
