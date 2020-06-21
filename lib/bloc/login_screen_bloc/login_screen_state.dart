part of 'login_screen_bloc.dart';

@immutable
@freezed
abstract class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState.initial() = _LoginScreenStateInitial;
  const factory LoginScreenState.error(String message) = _LoginScreenStateError;
  const factory LoginScreenState.success(User user) = _LoginScreenStateSuccess;
  const factory LoginScreenState.loading() = _LoginScreenStateLoading;
}
