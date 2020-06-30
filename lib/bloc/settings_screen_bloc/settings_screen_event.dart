part of 'settings_screen_bloc.dart';

@immutable
@freezed
abstract class SettingsScreenEvent with _$SettingsScreenEvent {
  const factory SettingsScreenEvent.editAvatar(String imagePath) =
      _SettingsScreenEditAvatar;
  const factory SettingsScreenEvent.editBio(String uid, String bio) =
      _SettingsScreenEventEditBio;
  const factory SettingsScreenEvent.requestUserStream(String uid) =
      _SettingsScreenEventRequestUserStream;
}
