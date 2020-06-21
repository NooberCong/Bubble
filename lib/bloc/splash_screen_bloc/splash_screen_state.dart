part of 'splash_screen_bloc.dart';

@immutable
@freezed
abstract class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState.initial() = _SplashScreenStateInitial;
  const factory SplashScreenState.authenticated(User user) =
      SplashScreenStateAuthenticated;
  const factory SplashScreenState.unauthenticated() =
      _SplashScreenStateUnauthenticated;
}
