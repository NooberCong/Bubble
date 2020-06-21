import 'package:auto_route/auto_route.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MessageContainer extends StatelessWidget {
  final Map<String, dynamic> messageData;
  final bool isFromUser;
  final bool isFirstMessage;
  final String otherUserAvatar;
  const MessageContainer({
    Key key,
    this.messageData,
    this.isFromUser,
    this.isFirstMessage,
    this.otherUserAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        _buildTimestamp(),
        _buildContent(context),
      ]),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: _padding(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            //Push messages to the left if it is from the current user otherwise push it to the right
            isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          _buildAvatar(),
          _buildMessage(context),
        ],
      ),
    );
  }

  Widget _buildMessage(BuildContext context) {
    final boxConstraints =
        BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 4 * 3);
    final borderRadius = BorderRadius.circular(20);
    switch (messageData["type"] as String) {
      case "MessageType.text":
        return _buildText(borderRadius, boxConstraints);
      case "MessageType.image":
        return _buildImage(context, borderRadius, boxConstraints);
      case "MessageType.sticker":
        return _buildSticker(borderRadius, boxConstraints);
      default:
        return const SizedBox();
    }
  }

  Container _buildText(
      BorderRadius borderRadius, BoxConstraints boxConstraints) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: _boxColor(),
        ),
        constraints: boxConstraints,
        child: Text(
          messageData["content"] as String,
          style: TextStyle(color: _textColor(), fontSize: 16),
        ));
  }

  Container _buildSticker(
      BorderRadius borderRadius, BoxConstraints boxConstraints) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(borderRadius: borderRadius),
      constraints: boxConstraints,
      child: Image.asset(
        messageData["content"] as String,
        fit: BoxFit.cover,
      ),
    );
  }

  GestureDetector _buildImage(BuildContext context, BorderRadius borderRadius,
      BoxConstraints boxConstraints) {
    return GestureDetector(
      onTap: () => _viewImage(context, messageData["content"] as String),
      child: Container(
        decoration: BoxDecoration(borderRadius: borderRadius),
        clipBehavior: Clip.hardEdge,
        constraints: boxConstraints,
        child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            placeholderErrorBuilder: (_, __, ___) =>
                Image.asset("assets/images/img_not_available.jpeg"),
            image: messageData["content"] as String),
      ),
    );
  }

  Color _textColor() {
    return isFromUser ? Colors.white : Colors.black;
  }

  Color _boxColor() {
    return isFromUser ? Colors.blue : Colors.grey[200];
  }

  Widget _buildTimestamp() {
    return isFirstMessage
        ? Text(
            messageTimestampFormat(messageData["timestamp"] as String),
            style: TextStyle(color: Colors.grey),
          )
        : const SizedBox();
  }

  EdgeInsets _padding() {
    return const EdgeInsets.symmetric(vertical: 5);
  }

  void _viewImage(BuildContext context, String url) {
    ExtendedNavigator.of(context).pushNamed(Routes.fullPhoto,
        arguments: FullPhotoArguments(url: url, title: "Photo view"));
  }

  Widget _buildAvatar() {
    return !isFromUser
        ? Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(otherUserAvatar),
              radius: 15,
            ),
          )
        : const SizedBox();
  }
}
