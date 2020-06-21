part of 'sign_up_screen_bloc.dart';

@immutable
@freezed
abstract class SignUpScreenEvent with _$SignUpScreenEvent {
  const factory SignUpScreenEvent.requestNameScreen() =
      _SignUpScreenEventRequestName;
  const factory SignUpScreenEvent.requestBioScreen(String lastNameInput) =
      _SignUpScreenEventRequestBio;
  const factory SignUpScreenEvent.requestEmailScreen(String lastBioInput) =
      _SignUpScreenEventRequestEmail;
  const factory SignUpScreenEvent.requestPasswordScreen(String lastEmailInput) =
      _SignUpScreenEventRequestPassword;
  const factory SignUpScreenEvent.requestFinishScreen(String lastPassword) =
      _SignUpScreenEventRequestFinish;
  const factory SignUpScreenEvent.requestLastState() =
      _SignUpScreenEventRequestLast;
}
