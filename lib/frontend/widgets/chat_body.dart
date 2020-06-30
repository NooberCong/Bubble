import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/message_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBody extends StatefulWidget {
  final Stream messageStream;
  final User otherUser;
  final bool canLoadMore;
  final double scrollOffset;
  final void Function(double) loadMoreMessages;
  const ChatBody(
      {Key key,
      this.messageStream,
      this.otherUser,
      this.scrollOffset,
      this.loadMoreMessages,
      this.canLoadMore})
      : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  ScrollController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController(initialScrollOffset: widget.scrollOffset);
    _controller.addListener(() {
      if (reachedTop() && widget.canLoadMore) {
        widget.loadMoreMessages(_controller.offset);
      }
    });
  }

  bool reachedTop() {
    return _controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: StreamBuilder(
        stream: widget.messageStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final messageList =
                snapshot.data.documents as List<DocumentSnapshot>;
            _markLastMessageAsSeen(messageList);
            return messageList.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (context, index) {
                      final data = messageList[index].data;
                      return MessageContainer(
                        messageData: data,
                        isFromUser: data["idFrom"] != widget.otherUser.uid,
                        isFirstMessage: _isFirst(index, messageList),
                        displaySeen: index == _lastSeenMessage(messageList),
                        otherUserAvatar: widget.otherUser.imageUrl,
                      );
                    },
                    itemCount: messageList.length,
                    reverse: true,
                    controller: _controller,
                  )
                : const Center(
                    child: Text("Say hi to break the ice!"),
                  );
          }
        },
      ),
    );
  }

  bool _isFirst(int index, List<DocumentSnapshot> messageList) {
    return index == messageList.length - 1 ||
        (index > 0 &&
            messageList[index - 1].data["idFrom"] !=
                messageList[index].data["idFrom"]);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _lastSeenMessage(List<DocumentSnapshot> messageList) {
    for (int i = 0; i < messageList.length; i++) {
      final message = messageList[i].data;
      if (message["idFrom"] == widget.otherUser.uid ||
          (message["idTo"] == widget.otherUser.uid &&
              message["seen"] as bool)) {
        return i;
      }
    }
    return -1;
  }

  void _markLastMessageAsSeen(List<DocumentSnapshot> messageList) {
    for (final message in messageList) {
      if (message.data["idFrom"] == widget.otherUser.uid &&
          !(message.data["seen"] as bool)) {
        context.bloc<ChatScreenBloc>().add(ChatScreenEvent.markAsSeen(
            getRoomIdFromUIDHashCode(message.data["idFrom"] as String,
                message.data["idTo"] as String),
            message.documentID));
      }
    }
  }
}
