part of 'inflatable_widget_bloc.dart';

@immutable
@freezed
abstract class InflatableWidgetEvent with _$InflatableWidgetEvent {
  const factory InflatableWidgetEvent.startAnimation() =
      _InflatableWidgetEventStartAnimation;
  const factory InflatableWidgetEvent.onLongPressRelease() =
      _InflatableWidgetEventPressRelease;
  const factory InflatableWidgetEvent.onAnimationStatusUpdate(
      AnimationStatus status) = _InflatableWidgetEventAnimationStatusUpdate;
  const factory InflatableWidgetEvent.onSizeUpdate(double size) =
      _InflatableWidgetStateSizeUpdate;
}
