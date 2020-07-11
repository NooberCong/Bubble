part of 'conversation_photos_showcase_bloc.dart';

@immutable
@freezed
abstract class ConversationPhotosShowcaseEvent
    with _$ConversationPhotosShowcaseEvent {
  const factory ConversationPhotosShowcaseEvent.loadImages(String roomId) =
      _ConversationPhotosShowcaseEventLoad;
}
