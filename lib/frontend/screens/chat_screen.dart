import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/bloc/inflatable_widget_bloc/inflatable_widget_bloc.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/providers/activity_controller_provider.dart';
import 'package:bubble/frontend/widgets/chat_bar.dart';
import 'package:bubble/frontend/widgets/chat_body.dart';
import 'package:bubble/frontend/widgets/chat_input.dart';
import 'package:bubble/frontend/providers/conversation_specifics_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget with WidgetsBindingObserver {
  final User user;
  final User otherUser;
  final ConversationSpecifics conversationSpecifics;
  final Stream<ConversationSpecifics> conversationSpecificsStream;
  final String roomId;

  ChatScreen({
    Key key,
    this.user,
    this.otherUser,
    this.conversationSpecifics,
    this.conversationSpecificsStream,
  })  : roomId = getRoomIdFromUIDHashCode(user.uid, otherUser.uid),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActivityControllerProvider(
      user: user,
      child: ConversationSpecificsProvider(
        user: user,
        otherUser: otherUser,
        roomId: roomId,
        initialData: conversationSpecifics,
        stream: conversationSpecificsStream,
        child: Scaffold(
          body: BlocProvider(
            create: (_) => getIt<ChatScreenBloc>(param1: roomId)
              ..add(ChatScreenEvent.requestMessageStream(
                  user.uid, otherUser.uid)),
            child: BlocProvider(
              create: (_) => getIt<InflatableWidgetBloc>(),
              child: Column(
                children: const <Widget>[
                  ChatBar(),
                  ChatBody(),
                  ChatInput(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
