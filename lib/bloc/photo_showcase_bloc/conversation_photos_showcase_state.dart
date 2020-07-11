part of 'conversation_photos_showcase_bloc.dart';

@immutable
@freezed
abstract class ConversationPhotosShowcaseState
    with _$ConversationPhotosShowcaseState {
  const factory ConversationPhotosShowcaseState.initial() =
      _ConversationPhotosShowcaseStateInitial;
  const factory ConversationPhotosShowcaseState.loaded(List<String> photoUrls) =
      _ConversationPhotosShowcaseStateLoaded;
  const factory ConversationPhotosShowcaseState.loading() =
      _ConversationPhotosShowcaseStateLoading;
  const factory ConversationPhotosShowcaseState.error(String message) =
      _ConversationPhotosShowcaseStateError;
  const factory ConversationPhotosShowcaseState.endReached() =
      _ConversationPhotosShowcaseStateEnd;
}
