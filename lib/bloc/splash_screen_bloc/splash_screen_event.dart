part of 'splash_screen_bloc.dart';

@immutable
@freezed
abstract class SplashScreenEvent with _$SplashScreenEvent {
  const factory SplashScreenEvent.requestAuthCheck() =
      _SplashScreenEventAuthCheck;
  const factory SplashScreenEvent.signOut() = _SplashScreenEventSignOut;
}
