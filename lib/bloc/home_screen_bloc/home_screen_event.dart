part of 'home_screen_bloc.dart';

@immutable
@freezed
abstract class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.requestConversations(String uid) =
      _HomeScreenEventConversations;
}
