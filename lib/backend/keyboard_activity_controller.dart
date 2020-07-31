import 'package:bubble/domain/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class KeyboardActivityController {
  final Firestore store;
  final User user;
  KeyboardActivityController(
    this.store,
    @factoryParam this.user,
  );
  bool _hasActivity = false;

  void addListener(TextEditingController controller, String roomId) {
    controller.addListener(() {
      if (controller.text.isEmpty) {
        if (_hasActivity) {
          _setTypingStatus(roomId, false);
          _hasActivity = false;
        }
      } else {
        if (!_hasActivity) {
          _setTypingStatus(roomId, true);
          _hasActivity = true;
          _setTimer(controller, roomId, controller.text);
        }
      }
    });
  }

  Stream<Map<String, dynamic>> getRoomTypingActivity(String roomId) {
    return store
        .collection("rooms")
        .document(roomId)
        .snapshots()
        .map((event) => event.data["typing"] as Map<String, dynamic>);
  }

  void _setTypingStatus(String roomId, bool value) {
    final roomReference = store.collection("rooms").document(roomId);
    roomReference.get().then((doc) {
      final typingUsers = doc.data["typing"] as Map<String, dynamic>;
      if (typingUsers[user.uid] != value) {
        typingUsers[user.uid] = value;
        roomReference.setData({"typing": typingUsers});
      }
    });
  }

  void _setTimer(TextEditingController controller, String roomId, String tmp) {
    if (controller == null) {
      return;
    }
    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (controller.text == tmp && _hasActivity) {
        _setTypingStatus(roomId, false);
        _hasActivity = false;
      } else {
        _setTimer(controller, roomId, controller.text);
      }
    });
  }
}
