import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:flutter/material.dart';

class ConversationSpecificsProvider extends InheritedWidget {
  const ConversationSpecificsProvider(
      {this.user,
      this.otherUser,
      this.roomId,
      this.stream,
      this.initialData,
      Key key,
      Widget child})
      : super(key: key, child: child);

  final Stream<ConversationSpecifics> stream;
  final ConversationSpecifics initialData;
  final String roomId;
  final User user;
  final User otherUser;

  static ConversationSpecificsProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ConversationSpecificsProvider>();
  }

  @override
  bool updateShouldNotify(ConversationSpecificsProvider oldWidget) {
    return true;
  }
}
