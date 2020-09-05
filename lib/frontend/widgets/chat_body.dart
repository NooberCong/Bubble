import 'dart:async';

import 'package:bubble/backend/room_activity_controller.dart';
import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/providers/activity_controller_provider.dart';
import 'package:bubble/frontend/providers/conversation_specifics_provider.dart';
import 'package:bubble/frontend/widgets/inflatable_emoji.dart';
import 'package:bubble/frontend/widgets/jumping_dots.dart';
import 'package:bubble/frontend/widgets/message_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({Key key}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> with WidgetsBindingObserver {
  //Initial context
  int _showMessageDetailsIndex = -1;
  Stream<dynamic> messageStream = const Stream.empty();
  bool _canLoadMore = true;
  bool _isLoading = false;
  ScrollController _controller;
  Stream<Map<String, dynamic>> _keyboardActivityStream;
  StreamSubscription _specificsSubscription;
  ConversationSpecifics specifics;
  RoomActivityController _roomActivityController;
  String roomId;
  User user;
  User otherUser;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _onAppStateChange(state);
    super.didChangeAppLifecycleState(state);
  }

  void _onAppStateChange(AppLifecycleState state) {
    //If chat screen is resumed, mark user as chatting with other user so that notification won't be sent
    if (state == AppLifecycleState.resumed) {
      ActivityControllerProvider.of(context).roomController.joinRoom(roomId);
      clearNotifications(roomId);
      context.bloc<ChatScreenBloc>().add(
          ChatScreenEvent.updateConversationLastMessageSeenStatus(user.uid));
    } else {
      //Otherwise, mark user as not chatting with the other user and let notifications be sent even if app is in chatscreen
      ActivityControllerProvider.of(context).roomController.leaveRoom(roomId);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = ScrollController(keepScrollOffset: true);
    _controller.addListener(() {
      if (_reachedTop() && _canLoadMore) {
        _loadMoreMessages();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    user = chatRoomUser(context);
    otherUser = chatRoomOtherUser(context);
    roomId = roomID(context);
    _roomActivityController =
        ActivityControllerProvider.of(context).roomController;
    _roomActivityController.joinRoom(roomId);
    specifics = ConversationSpecificsProvider.of(context).initialData;
    _specificsSubscription =
        ConversationSpecificsProvider.of(context).stream.listen((value) {
      if (_shouldUpdate(value)) {
        setState(() {
          specifics = value;
        });
      }
    });
    _keyboardActivityStream = ActivityControllerProvider.of(context)
        .keyboardController
        .getRoomTypingActivity(roomId);
  }

  bool _reachedTop() {
    return _controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatScreenBloc, ChatScreenState>(
      condition: (_, state) => state.maybeWhen(
          loading: () => true,
          loaded: (_) => true,
          notification: (_) => true,
          streamStateUpdate: (_) => true,
          orElse: () => false),
      listener: (context, state) {
        state.maybeWhen(
            loading: () {
              setState(() {
                _isLoading = true;
              });
            },
            loaded: (stream) {
              setState(() {
                _isLoading = false;
                messageStream = stream;
              });
            },
            notification: (msg) {
              Fluttertoast.showToast(msg: msg);
            },
            streamStateUpdate: (canLoadMore) {
              setState(() {
                _canLoadMore = canLoadMore;
              });
            },
            orElse: () {});
      },
      child: Flexible(
        child: StreamBuilder(
          initialData: _initialData(),
          stream: messageStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final messageList = snapshot.data as List<Message>;
              _saveCurrentMessages(messageList);
              _markMessagesAsSeen(messageList);
              return messageList.isNotEmpty
                  ? _buildBody(messageList)
                  : Center(
                      child: Text("Say hi to ${otherUser.username}"),
                    );
            }
          },
        ),
      ),
    );
  }

  bool _isFirst(int index, List<Message> messageList) {
    return index == messageList.length - 1;
  }

  @override
  void dispose() {
    _roomActivityController?.leaveRoom(roomId);
    WidgetsBinding.instance?.removeObserver(this);
    _specificsSubscription?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  int _lastSeenMessage(List<Message> messageList) {
    for (var i = 0; i < messageList.length; i++) {
      final message = messageList[i];
      if (!_isFromUser(message) || (_isFromUser(message) && message.seen)) {
        return i;
      }
    }
    return -1;
  }

  bool _isFromUser(Message message) => message.idFrom == user.uid;

  void _markMessagesAsSeen(List<Message> messageList) {
    for (final message in messageList) {
      if (!_isFromUser(message) && !message.seen) {
        context
            .bloc<ChatScreenBloc>()
            .add(ChatScreenEvent.markAsSeen(message.messageId));
      }
    }
  }

  void _loadMoreMessages() {
    context
        .bloc<ChatScreenBloc>()
        .add(ChatScreenEvent.requestMessageStream(user.uid, otherUser.uid));
  }

  void _saveCurrentMessages(List<Message> messages) {
    context
        .bloc<ChatScreenBloc>()
        .add(ChatScreenEvent.cacheConversation(messages));
  }

  List<Message> _initialData() {
    return context.bloc<ChatScreenBloc>().cachedConversation;
  }

  Widget _buildLoading() {
    return Container(
      height: 50,
      width: double.infinity,
      child: _isLoading && messageStream != const Stream.empty()
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox(),
    );
  }

  Widget _buildTyping() {
    return StreamBuilder(
      initialData: {user.uid: false, otherUser.uid: false},
      stream: _keyboardActivityStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data[otherUser.uid] as bool
              ? JumpingDots(
                  imageUrl: otherUser.imageUrl,
                  numberOfDots: 3,
                )
              : const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildBody(List<Message> messages) {
    return ListView.builder(
      //Plus 3 here are for inflatableEmoji, jumping dots and loading widgets
      itemCount: messages.length + 3,
      padding: const EdgeInsets.all(10.0),
      reverse: true,
      controller: _controller,
      itemBuilder: (context, index) {
        final realMessageIndex = index - 2;
        return index == 0
            ? InflatableEmoji()
            : index == 1
                ? _buildTyping()
                : index == messages.length + 2
                    ? _buildLoading()
                    : MessageContainer(
                        key: ValueKey(messages[realMessageIndex].timestamp),
                        specifics: specifics,
                        message: messages[realMessageIndex],
                        isFromUser: _isFromUser(messages[realMessageIndex]),
                        isFirstMessage: _isFirst(realMessageIndex, messages),
                        displaySeen:
                            realMessageIndex == _lastSeenMessage(messages) ||
                                index == 2,
                        otherUserAvatar: otherUser.imageUrl,
                        displayDetails:
                            realMessageIndex == _showMessageDetailsIndex,
                        showDetails: () => _showDetails(realMessageIndex),
                      );
      },
    );
  }

  void _showDetails(int index) {
    return setState(() {
      _showMessageDetailsIndex = _showMessageDetailsIndex == index ? -1 : index;
    });
  }

  bool _shouldUpdate(ConversationSpecifics value) {
    return specifics.themeColorCode != value.themeColorCode ||
        specifics.fontFamily != value.fontFamily;
  }
}
