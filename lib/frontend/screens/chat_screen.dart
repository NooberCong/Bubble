import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/chat_bar.dart';
import 'package:bubble/frontend/widgets/chat_body.dart';
import 'package:bubble/frontend/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  final User user;
  final User otherUser;

  const ChatScreen({
    Key key,
    this.user,
    this.otherUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<ChatScreenBloc>(
            param1: getRoomIdFromUIDHashCode(user.uid, otherUser.uid))
          ..add(ChatScreenEvent.requestMessageStream(user.uid, otherUser.uid)),
        child: Column(
          children: <Widget>[
            ChatBar(otherUser: otherUser),
            ChatBody(
              user: user,
              otherUser: otherUser,
            ),
            ChatInput(
              otherUserId: otherUser.uid,
            ),
          ],
        ),
      ),
    );
  }
}
