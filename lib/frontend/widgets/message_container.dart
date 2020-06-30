import 'package:auto_route/auto_route.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';

class MessageContainer extends StatelessWidget {
  final Map<String, dynamic> messageData;
  final bool isFromUser;
  final bool isFirstMessage;
  final String otherUserAvatar;
  final bool displaySeen;
  const MessageContainer({
    Key key,
    this.messageData,
    this.isFromUser,
    this.isFirstMessage,
    this.otherUserAvatar,
    this.displaySeen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        _buildTimestamp(),
        _buildContent(context),
        _buildSeenStatus()
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
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: _buildBasedOnType(borderRadius, boxConstraints, context));
  }

  Widget _buildBasedOnType(BorderRadius borderRadius,
      BoxConstraints boxConstraints, BuildContext context) {
    switch (messageData["type"] as String) {
      case "MessageType.text":
        return _buildText(borderRadius, boxConstraints, context);
      case "MessageType.image":
        return _buildImage(context, borderRadius, boxConstraints);
      case "MessageType.sticker":
        return _buildSticker(borderRadius, boxConstraints);
      case "MessageType.svg":
        return _buildSvg(
            borderRadius, boxConstraints, Theme.of(context).accentColor);
      default:
        return const SizedBox();
    }
  }

  Container _buildText(BorderRadius borderRadius, BoxConstraints boxConstraints,
      BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: _boxColor(context),
        ),
        constraints: boxConstraints,
        child: Text(
          messageData["content"] as String,
          style: TextStyle(color: _textColor(context), fontSize: 16),
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

  Color _textColor(BuildContext context) {
    return isFromUser
        ? Colors.white
        : Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black;
  }

  Color _boxColor(BuildContext context) {
    return isFromUser
        ? Colors.blue
        : Theme.of(context).brightness == Brightness.dark
            ? Colors.grey.shade800
            : Colors.grey.shade300;
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

  Widget _buildSvg(
      BorderRadius borderRadius, BoxConstraints boxConstraints, Color color) {
    return SvgPicture.asset(
      messageData["content"] as String,
      color: color,
      width: 60,
      height: 60,
    );
  }

  Widget _buildSeenStatus() {
    if (displaySeen) {
      return Align(
        alignment: Alignment.centerRight,
        child: CircleAvatar(
          radius: 8,
          backgroundImage: NetworkImage(otherUserAvatar),
        ),
      );
    }
    return const SizedBox();
  }
}
