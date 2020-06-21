part of 'login_screen_bloc.dart';

@immutable
@freezed
abstract class LoginScreenEvent with _$LoginScreenEvent {
  const factory LoginScreenEvent.loginWithEmailAndPassword(
      String email, String password) = _LoginScreenEventEmailAndPassword;
  const factory LoginScreenEvent.loginWithGoogle() = _LoginScreenEventGoogle;
}
