import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:flutter/material.dart';

class ConversationSpecificsProvider extends InheritedWidget {
  const ConversationSpecificsProvider(
      {this.stream, this.initialData, Key key, Widget child})
      : super(key: key, child: child);

  final Stream<ConversationSpecifics> stream;
  final ConversationSpecifics initialData;

  static ConversationSpecificsProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ConversationSpecificsProvider>();
  }

  @override
  bool updateShouldNotify(ConversationSpecificsProvider oldWidget) {
    return true;
  }
}
