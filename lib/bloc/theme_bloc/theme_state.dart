part of 'theme_bloc.dart';

@immutable
@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = _ThemeStateInitial;
  const factory ThemeState.loaded(ThemeMode mode) = ThemeStateLoaded;
}
