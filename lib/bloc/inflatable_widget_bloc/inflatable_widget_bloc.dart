import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'inflatable_widget_event.dart';
part 'inflatable_widget_state.dart';
part 'inflatable_widget_bloc.freezed.dart';

@injectable
class InflatableWidgetBloc
    extends Bloc<InflatableWidgetEvent, InflatableWidgetState> {
  AnimationStatus currentStatus;
  double currentSizeValue = 60.0; //Default value
  @override
  Stream<InflatableWidgetState> mapEventToState(
    InflatableWidgetEvent event,
  ) async* {
    yield* event.when(startAnimation: () async* {
      yield const InflatableWidgetState.refresh();
      yield const InflatableWidgetState.animate();
    }, onLongPressRelease: () async* {
      if (currentStatus != AnimationStatus.completed) {
        yield InflatableWidgetState.sendEmoji(currentSizeValue);
      }
    }, onAnimationStatusUpdate: (AnimationStatus status) async* {
      currentStatus = status;
    }, onSizeUpdate: (double size) async* {
      currentSizeValue = size ?? currentSizeValue;
    });
  }

  @override
  InflatableWidgetState get initialState =>
      const InflatableWidgetState.initial();
}
