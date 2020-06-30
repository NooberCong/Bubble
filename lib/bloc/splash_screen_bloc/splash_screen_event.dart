part of 'splash_screen_bloc.dart';

@immutable
@freezed
abstract class SplashScreenEvent with _$SplashScreenEvent {
  const factory SplashScreenEvent.requestAuthCheck() =
      _SplashScreenEventAuthCheck;
  const factory SplashScreenEvent.signOut(String uid) =
      _SplashScreenEventSignOut;
  const factory SplashScreenEvent.authenticate(User user) =
      _SplashScreenEventAuthenticate;
}
