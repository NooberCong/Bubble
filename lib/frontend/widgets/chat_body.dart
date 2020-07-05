import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:bubble/domain/entities/user.dart';
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
  Stream<dynamic> messageStream = const Stream.empty();
  bool canLoadMore = false;
  bool isLoading = false;
  ScrollController _controller;
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
        child: Stack(
          children: <Widget>[
            buildLoading(),
            StreamBuilder(
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
                      ? ListView.builder(
                          padding: const EdgeInsets.all(10.0),
                          itemBuilder: (context, index) {
                            final message = messageList[index];
                            return MessageContainer(
                              message: message,
                              isFromUser: _isFromUser(message),
                              isFirstMessage: _isFirst(index, messageList),
                              displaySeen:
                                  index == _lastSeenMessage(messageList),
                              otherUserAvatar: widget.otherUser.imageUrl,
                            );
                          },
                          itemCount: messageList.length,
                          reverse: true,
                          controller: _controller,
                        )
                      : Center(
                          child: Text("Say hi to ${widget.otherUser.username}"),
                        );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _isFirst(int index, List<Message> messageList) {
    return index == messageList.length - 1;
  }

  @override
  void dispose() {
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

  Widget buildLoading() {
    return Container(
      height: 80,
      width: double.infinity,
      child: isLoading && messageStream != const Stream.empty()
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox(),
    );
  }
}
