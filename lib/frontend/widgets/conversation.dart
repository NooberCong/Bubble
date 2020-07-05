import 'dart:convert';

import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/frontend/widgets/cached_image.dart';
import 'package:bubble/frontend/widgets/user_status_ball.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Conversation extends StatelessWidget {
  final DocumentSnapshot conversationSnapshot;
  final Map<String, dynamic> data;
  final User otherUser;
  Conversation({Key key, this.conversationSnapshot})
      : data = conversationSnapshot.data,
        otherUser = User.fromJson(
            json.decode(conversationSnapshot.data["otherUser"] as String)
                as Map<String, dynamic>),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => _navigateToChatScreen(context, otherUser),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              CachedCircularImage(
                imageUrl: otherUser.imageUrl,
                radius: 30,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: UserStatusBall(
                  key: UniqueKey(),
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
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        data["otherUserNickname"] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(_lastMessage(),
                    style: TextStyle(
                        color: _colorFromSeenStatus(context), fontSize: 14))
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
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  Color _colorFromSeenStatus(BuildContext context) {
    return data["seen"] as bool
        ? Colors.grey
        : Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black;
  }

  String _lastMessage() {
    return "${_prefix(data['userSentLastMessage'])}${data["lastMessage"]}";
  }

  void _navigateToChatScreen(BuildContext context, User otherUser) {
    ExtendedNavigator.of(context).pushNamed(
      Routes.chatScreen,
      arguments: ChatScreenArguments(
          user: (context.bloc<SplashScreenBloc>().state
                  as SplashScreenStateAuthenticated)
              .user,
          otherUser: otherUser,
          conversationSpecifics: ConversationSpecifics.fromJson(data),
          conversationSpecificsStream: conversationSnapshot.reference
              .snapshots()
              .map(
                  (snapshot) => ConversationSpecifics.fromJson(snapshot.data))),
    );
  }

  String _prefix(dynamic userSentLastMessage) {
    if (userSentLastMessage == null) {
      return "";
    }
    return (userSentLastMessage as bool) ? "You" : otherUser.username;
  }
}
