import 'dart:async';

import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/conversation_specifics_provider.dart';
import 'package:bubble/frontend/widgets/message_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatBody extends StatefulWidget {
  final User user;
  final User otherUser;
  const ChatBody({Key key, this.otherUser, this.user}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  //Initial context
  int _showMessageDetailsIndex = -1;
  Stream<dynamic> messageStream = const Stream.empty();
  bool canLoadMore = false;
  bool isLoading = false;
  ScrollController _controller;
  StreamSubscription _specificsSubscription;
  ConversationSpecifics specifics;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController(keepScrollOffset: true);
    _controller.addListener(() {
      if (_reachedTop() && canLoadMore) {
        _loadMoreMessages();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    specifics = ConversationSpecificsProvider.of(context).initialData;
    _specificsSubscription =
        ConversationSpecificsProvider.of(context).stream.listen((value) {
      if (_shouldUpdate(value)) {
        setState(() {
          specifics = value;
        });
      }
    });
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
          loaded: (_, __) => true,
          notification: (_) => true,
          orElse: () => false),
      listener: (context, state) {
        state.maybeWhen(
            loading: () {
              setState(() {
                isLoading = true;
              });
            },
            loaded: (stream, endReached) {
              setState(() {
                isLoading = false;
                messageStream = stream;
                canLoadMore = !endReached;
              });
            },
            notification: (msg) {
              Fluttertoast.showToast(msg: msg);
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
                      child: Text("Say hi to ${widget.otherUser.username}"),
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
    _specificsSubscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  int _lastSeenMessage(List<Message> messageList) {
    for (int i = 0; i < messageList.length; i++) {
      final message = messageList[i];
      if (!_isFromUser(message) || (_isFromUser(message) && message.seen)) {
        return i;
      }
    }
    return -1;
  }

  bool _isFromUser(Message message) => message.idFrom == widget.user.uid;

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
    context.bloc<ChatScreenBloc>().add(ChatScreenEvent.requestMessageStream(
        widget.user.uid, widget.otherUser.uid));
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
      child: isLoading && messageStream != const Stream.empty()
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox(),
    );
  }

  Widget _buildBody(List<Message> messages) {
    final widgets = <Widget>[];
    for (int i = 0; i < messages.length; i++) {
      final message = messages[i];
      widgets.add(MessageContainer(
        key: ValueKey(message.timestamp),
        specifics: specifics,
        message: message,
        isFromUser: _isFromUser(message),
        isFirstMessage: _isFirst(i, messages),
        displaySeen: i == _lastSeenMessage(messages),
        otherUserAvatar: widget.otherUser.imageUrl,
        displayDetails: i == _showMessageDetailsIndex,
        showDetails: () {
          setState(() {
            _showMessageDetailsIndex = _showMessageDetailsIndex == i ? -1 : i;
          });
        },
      ));
    }
    return ListView(
        padding: const EdgeInsets.all(10.0),
        reverse: true,
        controller: _controller,
        addAutomaticKeepAlives: false,
        children: widgets..add(_buildLoading()));
  }

  bool _shouldUpdate(ConversationSpecifics value) {
    return specifics.themeColorCode != value.themeColorCode ||
        specifics.fontFamily != value.fontFamily;
  }
}
