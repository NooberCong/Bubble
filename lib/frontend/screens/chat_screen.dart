import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/chat_body.dart';
import 'package:bubble/frontend/widgets/chat_input.dart';
import 'package:bubble/frontend/widgets/user_status_ball.dart';
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
      appBar: AppBar(
        elevation: 1,
        brightness: Brightness.light,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(otherUser.imageUrl),
              radius: 25,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(otherUser.username,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14)),
                UserStatusBall(
                  uid: otherUser.uid,
                  showText: true,
                )
              ],
            )
          ],
        ),
      ),
      body: BlocProvider(
        create: (_) => getIt<ChatScreenBloc>()
          ..add(ChatScreenEvent.requestMessageStream(user.uid, otherUser.uid)),
        child: BlocListener<ChatScreenBloc, ChatScreenState>(
          condition: (_, state) =>
              state.maybeWhen(notification: (_) => true, orElse: () => false),
          listener: (_, state) {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text((state as ChatScreenStateNotification).message)));
          },
          child: Column(
            children: <Widget>[
              BlocBuilder<ChatScreenBloc, ChatScreenState>(
                condition: (_, state) => state.maybeWhen(
                    loading: () => true,
                    loaded: (_) => true,
                    error: (_) => true,
                    orElse: () => false),
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    loaded: (stream) {
                      return ChatBody(
                        messageStream: stream,
                        otherUser: otherUser,
                      );
                    },
                    error: (errorMsg) => Center(
                      child: Text(errorMsg),
                    ),
                    orElse: () => const SizedBox(),
                  );
                },
              ),
              ChatInput(
                otherUserId: otherUser.uid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
