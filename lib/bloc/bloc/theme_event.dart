part of 'theme_bloc.dart';

@immutable
@freezed
abstract class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.setTheme(ThemeMode mode) = _ThemeEventSystem;
  const factory ThemeEvent.restoreSavedTheme() = __ThemeEventStored;
}
