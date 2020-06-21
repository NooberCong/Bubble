part of 'sign_up_screen_bloc.dart';

@immutable
@freezed
abstract class SignUpScreenState with _$SignUpScreenState {
  const factory SignUpScreenState.initial() = _SignUpScreenStateInitial;
  const factory SignUpScreenState.name(
      String initialValue, String errorMsgOrEmpty) = SignUpScreenStateName;
  const factory SignUpScreenState.bio(
      String initialValue, String errorMsgOrEmpty) = SignUpScreenStateBio;
  const factory SignUpScreenState.email(
      String initialValue, String errorMsgOrEmpty) = SignUpScreenStateEmail;
  const factory SignUpScreenState.password(
      String initialValue, String errorMsgOrEmpty) = SignUpScreenStatePassword;
  const factory SignUpScreenState.finish(User user) = _SignUpScreenStateFinish;
  const factory SignUpScreenState.loading() = _SignUpScreenStateLoading;
}
