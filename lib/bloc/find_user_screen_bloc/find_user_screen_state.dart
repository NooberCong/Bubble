part of 'find_user_screen_bloc.dart';

@immutable
@freezed
abstract class FindUserScreenState with _$FindUserScreenState {
  const factory FindUserScreenState.initial() = _FindUserScreenStateInitial;
  const factory FindUserScreenState.loading() = FindUserScreenStateLoading;
  const factory FindUserScreenState.loaded(User user) =
      _FindUserScreenStateLoaded;
  const factory FindUserScreenState.error(String message) =
      _FindUserScreenStateError;
}
