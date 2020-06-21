part of 'home_screen_bloc.dart';

@immutable
@freezed
abstract class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState.initial() = _HomeScreenStateInitial;
  const factory HomeScreenState.conversationsStreamLoaded(
      Stream conversationsStream) = _HomeScreenStateConversationsLoaded;
  const factory HomeScreenState.error(String message) = _HomeScreenStateError;
}
