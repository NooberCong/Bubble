part of 'user_status_ball_bloc.dart';

@immutable
@freezed
abstract class UserStatusBallState with _$UserStatusBallState {
  const factory UserStatusBallState.initial() = _UserStatusBallStateInitial;
  const factory UserStatusBallState.userStatusStreamLoaded(Stream stream) =
      _UserStatusBallStatePeerStatusLoaded;
  const factory UserStatusBallState.error(String message) =
      _UserStatusBallStateError;
}
