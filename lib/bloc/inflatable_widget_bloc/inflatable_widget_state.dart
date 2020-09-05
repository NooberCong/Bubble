part of 'inflatable_widget_bloc.dart';

@immutable
@freezed
abstract class InflatableWidgetState with _$InflatableWidgetState {
  const factory InflatableWidgetState.initial() = _InflatableWidgetStateInitial;
  const factory InflatableWidgetState.sendEmoji(double size) =
      _InflatableWidgetStateSend;
  const factory InflatableWidgetState.animate() = _InflatableWidgetStateAnimate;
  const factory InflatableWidgetState.refresh() = _InflatableWidgetStateRefresh;
}
