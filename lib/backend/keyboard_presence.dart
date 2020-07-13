import 'package:bubble/domain/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KeyboardPresence {
  final Firestore store;
  KeyboardPresence(this.store);

  User currentUser;

  String uid;

  bool timerIsSet = false;

  String temp = "";

  void initialize(TextEditingController controller, String roomId, User user) {
    uid = user.uid;
    _registerActivity(roomId);
    controller.addListener(() {
      if (controller.text.isEmpty) {
        setTypingStatus(roomId, false);
        temp = "";
      } else if (controller.text != temp && !timerIsSet) {
        setTypingStatus(roomId, true);
        temp = controller.text;
        setTimer(controller, roomId);
      }
    });
  }

  void _registerActivity(String roomId) {
    store.collection("users").document(uid).get().then((value) {
      if (!(value.data["activeChatRooms"] as List<String>).contains(roomId)) {
        value.reference.updateData({
          "activeChatRooms": (value.data["activeChatRooms"] as List<String>)
            ..add(roomId)
        });
      }
    });
  }

  void setTypingStatus(String roomId, bool value) {
    final roomReference = store.collection("rooms").document(roomId);
    roomReference.get().then((doc) {
      final typingUsers = doc.data["typing"] as Map<String, bool>;
      if (typingUsers[uid] != value) {
        typingUsers[uid] = value;
        roomReference.setData({"typing": typingUsers});
      }
    });
  }

  void setTimer(TextEditingController controller, String roomId) {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (controller.text == temp) {
        setTypingStatus(roomId, false);
        timerIsSet = false;
      } else {
        temp = controller.text;
        setTimer(controller, roomId);
      }
    });
  }
}
