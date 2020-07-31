import 'package:bubble/backend/room_activity_controller.dart';
import 'package:bubble/backend/keyboard_activity_controller.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:flutter/material.dart';

class ActivityControllerProvider extends InheritedWidget {
  final RoomActivityController roomController;
  final KeyboardActivityController keyboardController;

  ActivityControllerProvider({User user, Key key, Widget child})
      : keyboardController = getIt<KeyboardActivityController>(param1: user),
        roomController = getIt<RoomActivityController>(param1: user),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(ActivityControllerProvider oldWidget) {
    return true;
  }

  static ActivityControllerProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ActivityControllerProvider>();
  }
}
