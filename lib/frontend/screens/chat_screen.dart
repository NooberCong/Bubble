import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/chat_body.dart';
import 'package:bubble/frontend/widgets/chat_input.dart';
import 'package:bubble/frontend/widgets/user_status_ball.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  final User otherUser;

  const ChatScreen({
    Key key,
    this.user,
    this.otherUser,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  double messagesScrollOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              onPressed: _navigateToOtherUserInfoScreen,
            ),
          )
        ],
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(widget.otherUser.imageUrl),
              radius: 25,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.otherUser.username,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                UserStatusBall(
                  uid: widget.otherUser.uid,
                  showText: true,
                )
              ],
            )
          ],
        ),
      ),
      body: BlocProvider(
        create: (_) => getIt<ChatScreenBloc>()
          ..add(ChatScreenEvent.requestMessageStream(
              widget.user.uid, widget.otherUser.uid)),
        child: BlocListener<ChatScreenBloc, ChatScreenState>(
          condition: (_, state) =>
              state.maybeWhen(notification: (_) => true, orElse: () => false),
          listener: (_, state) {
            Fluttertoast.showToast(
                msg: (state as ChatScreenStateNotification).message);
          },
          child: Column(
            children: <Widget>[
              BlocBuilder<ChatScreenBloc, ChatScreenState>(
                condition: (_, state) => state.maybeWhen(
                    loading: () => true,
                    loaded: (_, __) => true,
                    error: (_) => true,
                    orElse: () => false),
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    loaded: (stream, endOfCollectionReached) {
                      return ChatBody(
                        messageStream: stream,
                        otherUser: widget.otherUser,
                        canLoadMore: !endOfCollectionReached,
                        scrollOffset: messagesScrollOffset,
                        loadMoreMessages: (offset) =>
                            _onloadMessagesRequest(context, offset),
                      );
                    },
                    error: (errorMsg) => Center(
                      child: Text(errorMsg),
                    ),
                    orElse: () => const SizedBox(),
                  );
                },
              ),
              KeyboardVisibilityProvider(
                child: ChatInput(
                  otherUserId: widget.otherUser.uid,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onloadMessagesRequest(BuildContext context, double offset) {
    _saveLastScrollPosition(offset);
    _loadMoreMessages(context);
  }

  void _loadMoreMessages(BuildContext context) {
    context.bloc<ChatScreenBloc>().add(ChatScreenEvent.requestMessageStream(
        widget.user.uid, widget.otherUser.uid));
  }

  void _saveLastScrollPosition(double offset) {
    setState(() {
      messagesScrollOffset = offset;
    });
  }

  void _navigateToOtherUserInfoScreen() {
    ExtendedNavigator.of(context).pushNamed(Routes.otherUserInfoScreen,
        arguments: OtherUserInfoScreenArguments(user: widget.otherUser));
  }
}
