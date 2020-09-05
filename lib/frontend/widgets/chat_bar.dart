import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/cached_image.dart';
import 'package:bubble/frontend/providers/conversation_specifics_provider.dart';
import 'package:bubble/frontend/widgets/user_status_ball.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBar extends StatefulWidget {
  const ChatBar({
    Key key,
  }) : super(key: key);

  @override
  _ChatBarState createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  ConversationSpecifics specifics;
  StreamSubscription _specificsSubscription;
  bool connectionEstablished = false;
  User otherUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    specifics = ConversationSpecificsProvider.of(context).initialData;
    _specificsSubscription =
        ConversationSpecificsProvider.of(context).stream.listen((value) {
      if (_shouldUpdate(value) && mounted) {
        setState(() {
          specifics = value;
        });
      }
    });
    otherUser = chatRoomOtherUser(context);
  }

  @override
  void dispose() {
    super.dispose();
    _specificsSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatScreenBloc, ChatScreenState>(
      condition: (_, state) =>
          state.maybeWhen(loaded: (_) => true, orElse: () => false),
      listener: (_, state) {
        state.maybeWhen(
            loaded: (_) {
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
                color: Color(specifics.themeColorCode),
              ),
              onPressed: _navigateToConversationDetailsScreen,
            ),
          )
        ],
        title: Row(
          children: <Widget>[
            CachedCircularImage(
              imageUrl: otherUser.imageUrl,
              radius: 25,
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: _navigateToConversationDetailsScreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(specifics.nicknames[otherUser.uid] as String,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                  UserStatusBall(
                    uid: otherUser.uid,
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

  void _navigateToConversationDetailsScreen() {
    ExtendedNavigator.of(context).pushNamed(Routes.conversationDetailsScreen,
        arguments: ConversationDetailsScreenArguments(
            otherUser: otherUser,
            onConversationDataUpdate: (data) {
              context
                  .bloc<ChatScreenBloc>()
                  .add(ChatScreenEvent.updateConversationData(data));
            },
            initialSpecifics: specifics,
            specificsStream: ConversationSpecificsProvider.of(context).stream));
  }

  Widget _buildConnectionStatus() {
    return connectionEstablished
        ? const SizedBox()
        : const Text(
            "Connecting...",
            style: TextStyle(color: Colors.red, fontSize: 12),
          );
  }

  bool _shouldUpdate(ConversationSpecifics value) {
    return specifics.nicknames.values
            .toSet()
            .difference(value.nicknames.values.toSet())
            .isNotEmpty ||
        specifics.themeColorCode != value.themeColorCode;
  }
}
