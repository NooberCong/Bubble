part of 'settings_screen_bloc.dart';

@immutable
@freezed
abstract class SettingsScreenState with _$SettingsScreenState {
  const factory SettingsScreenState.initial() = _SettingsScreenStateInitial;
  const factory SettingsScreenState.userStreamLoaded(Stream stream) =
      _SettingsScreenStateUserStreamLoaded;
  const factory SettingsScreenState.notify(String message) =
      SettingsScreenStateNotify;
  const factory SettingsScreenState.processing() =
      _SettingsScrenStateProcessing;
}
