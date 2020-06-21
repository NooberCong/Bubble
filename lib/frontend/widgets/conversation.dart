import 'dart:convert';

import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/frontend/widgets/user_status_ball.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Conversation extends StatelessWidget {
  final Map<String, dynamic> data;
  const Conversation({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otherUser = User.fromJson(
        json.decode(data["otherUser"] as String) as Map<String, dynamic>);
    return FlatButton(
      onPressed: () => _navigateToChatScreen(context, otherUser),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(otherUser.imageUrl),
                backgroundColor: Colors.grey,
                radius: 30,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: UserStatusBall(
                  uid: otherUser.uid,
                  showText: false,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(otherUser.username,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text(_lastMessage(otherUser.username),
                    style: TextStyle(color: Colors.grey, fontSize: 14))
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            DateFormat("kk:mm").format(
              DateTime.fromMillisecondsSinceEpoch(
                int.parse(
                  data["lastActive"] as String,
                ),
              ),
            ),
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  String _lastMessage(String otherUserName) {
    final messageIsFromUser = data["userSentLastMessage"] as bool;
    return "${messageIsFromUser ? 'You' : otherUserName}${data["lastMessage"]}";
  }

  void _navigateToChatScreen(BuildContext context, User otherUser) {
    ExtendedNavigator.of(context).pushNamed(Routes.chatScreen,
        arguments: ChatScreenArguments(
            user: (context.bloc<SplashScreenBloc>().state
                    as SplashScreenStateAuthenticated)
                .user,
            otherUser: otherUser));
  }
}
