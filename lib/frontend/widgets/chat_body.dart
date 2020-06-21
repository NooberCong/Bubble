import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/message_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatefulWidget {
  final Stream messageStream;
  final User otherUser;
  const ChatBody({Key key, this.messageStream, this.otherUser})
      : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final _controller = ScrollController();
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
            return messageList.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (context, index) {
                      final data = messageList[index].data;
                      return MessageContainer(
                        messageData: data,
                        isFromUser: data["idFrom"] != widget.otherUser.uid,
                        isFirstMessage: _isFirst(index, messageList),
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
}
