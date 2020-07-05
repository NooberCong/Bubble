import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/cached_image.dart';
import 'package:bubble/frontend/widgets/user_status_ball.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBar extends StatefulWidget {
  const ChatBar({
    Key key,
    @required this.otherUser,
  }) : super(key: key);

  final User otherUser;

  @override
  _ChatBarState createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  bool connectionEstablished = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatScreenBloc, ChatScreenState>(
      condition: (_, state) =>
          state.maybeWhen(loaded: (_, __) => true, orElse: () => false),
      listener: (_, state) {
        state.maybeWhen(
            loaded: (_, __) {
              if (!connectionEstablished) {
                setState(() {
                  connectionEstablished = true;
                });
              }
            },
            orElse: () {});
      },
      child: AppBar(
        titleSpacing: 0,
        elevation: 1,
        actions: <Widget>[
          ButtonTheme(
            minWidth: 0,
            padding: EdgeInsets.zero,
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 32,
              icon: Icon(
                Icons.info,
                color: Colors.blue,
              ),
              onPressed: () => _navigateToOtherUserInfoScreen(context),
            ),
          )
        ],
        title: Row(
          children: <Widget>[
            CachedCircularImage(
              imageUrl: widget.otherUser.imageUrl,
              radius: 25,
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => _navigateToOtherUserInfoScreen(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.otherUser.username,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                  UserStatusBall(
                    uid: widget.otherUser.uid,
                    showText: true,
                  ),
                  _buildConnectionStatus()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToOtherUserInfoScreen(BuildContext context) {
    ExtendedNavigator.of(context).pushNamed(Routes.otherUserInfoScreen,
        arguments: OtherUserInfoScreenArguments(user: widget.otherUser));
  }

  Widget _buildConnectionStatus() {
    return connectionEstablished
        ? const SizedBox()
        : const Text(
            "Connecting...",
            style: TextStyle(color: Colors.red, fontSize: 12),
          );
  }
}
