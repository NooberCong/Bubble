import 'package:auto_route/auto_route.dart';
import 'package:bubble/core/constants/fonts.dart';
import 'package:bubble/core/constants/svgs.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:bubble/frontend/widgets/cached_image.dart';
import 'package:bubble/router.gr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';

class MessageContainer extends StatefulWidget {
  final ConversationSpecifics specifics;
  final Message message;
  final bool isFromUser;
  final bool displayDetails;
  final bool isFirstMessage;
  final String otherUserAvatar;
  final bool displaySeen;
  final void Function() showDetails;
  static const Duration animationDuration = Duration(milliseconds: 250);
  const MessageContainer({
    Key key,
    this.message,
    this.isFromUser,
    this.isFirstMessage,
    this.otherUserAvatar,
    this.displaySeen,
    this.specifics,
    this.showDetails,
    this.displayDetails,
  }) : super(key: key);

  @override
  _MessageContainerState createState() => _MessageContainerState();
}

class _MessageContainerState extends State<MessageContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        _buildTimestamp(),
        _buildContent(),
        _buildSeenStatus()
      ]),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: _padding(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            //Push messages to the left if it is from the current user otherwise push it to the right
            widget.isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          _buildAvatar(),
          _buildMessage(),
        ],
      ),
    );
  }

  Widget _buildMessage() {
    final boxConstraints =
        BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 4 * 3);
    final borderRadius = BorderRadius.circular(20);
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: GestureDetector(
            onTap: _onMessageTap,
            child: _buildBasedOnType(borderRadius, boxConstraints)));
  }

  void _onMessageTap() {
    if (widget.message.type != MessageType.image) {
      widget.showDetails();
    } else {
      _viewImage(context, widget.message.content);
    }
  }

  Widget _buildBasedOnType(
      BorderRadius borderRadius, BoxConstraints boxConstraints) {
    switch (widget.message.type) {
      case MessageType.text:
        return _buildText(borderRadius, boxConstraints);
      case MessageType.image:
        return _buildImage(borderRadius, boxConstraints);
      case MessageType.sticker:
        return _buildSticker(borderRadius, boxConstraints);
      case MessageType.svg:
        return _buildSvg(borderRadius, boxConstraints);
      default:
        return const SizedBox();
    }
  }

  Widget _buildText(BorderRadius borderRadius, BoxConstraints boxConstraints) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: _boxColor(context, widget.message.content),
      ),
      constraints: boxConstraints,
      child: Text(
        widget.message.content,
        style: TextStyle(
            color: _textColor(context),
            fontSize: fontSize(widget.message.content),
            fontFamily: widget.specifics.fontFamily),
      ),
    );
  }

  Container _buildSticker(
      BorderRadius borderRadius, BoxConstraints boxConstraints) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(borderRadius: borderRadius),
      constraints: boxConstraints,
      child: Image.asset(
        widget.message.content,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildImage(BorderRadius borderRadius, BoxConstraints boxConstraints) {
    return Container(
      decoration: BoxDecoration(borderRadius: borderRadius),
      clipBehavior: Clip.hardEdge,
      constraints: boxConstraints,
      child: CachedNetworkImage(
          placeholder: (_, __) => Image.memory(kTransparentImage),
          errorWidget: (_, __, ___) =>
              Image.asset("assets/images/img_not_available.jpeg"),
          imageUrl: widget.message.content),
    );
  }

  Color _textColor(BuildContext context) {
    return widget.isFromUser
        ? Colors.white
        : Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black;
  }

  Color _boxColor(BuildContext context, String content) {
    // ignore: unnecessary_raw_strings
    return (_isAllEmojis(content)
            ? Colors.transparent
            : widget.isFromUser
                ? Color(widget.specifics.themeColorCode)
                : Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade800
                    : Colors.grey.shade300)
        .withOpacity(widget.displayDetails ? .75 : 1);
  }

  bool _isAllEmojis(String content) => !content.contains(RegExp(r"\w"));

  Widget _buildTimestamp() {
    return AnimatedOpacity(
      opacity: (widget.isFirstMessage || widget.displayDetails) ? 1 : 0,
      duration: MessageContainer.animationDuration,
      child: AnimatedContainer(
        height: (widget.isFirstMessage || widget.displayDetails) ? 20 : 0,
        duration: MessageContainer.animationDuration,
        child: Text(
          messageTimestampFormat(widget.message.timestamp),
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  EdgeInsets _padding() {
    return const EdgeInsets.symmetric(vertical: 5);
  }

  void _viewImage(BuildContext context, String url) {
    ExtendedNavigator.of(context).pushNamed(Routes.fullPhoto,
        arguments: FullPhotoArguments(url: url, title: "Photo view"));
  }

  Widget _buildAvatar() {
    return !widget.isFromUser
        ? Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CachedCircularImage(
              imageUrl: widget.otherUserAvatar,
              radius: 15,
            ),
          )
        : const SizedBox();
  }

  Widget _buildSvg(BorderRadius borderRadius, BoxConstraints boxConstraints) {
    return SvgPicture.asset(
      widget.message.content,
      color: colorForSvg(
          widget.message.content,
          Color(widget.specifics.themeColorCode)
              .withOpacity(widget.displayDetails ? .75 : 1)),
      width: 60,
      height: 60,
    );
  }

  Widget _buildSeenStatus() {
    return Column(
      children: <Widget>[
        AnimatedOpacity(
          duration: MessageContainer.animationDuration,
          opacity: widget.displayDetails ? 1 : 0,
          child: AnimatedContainer(
            duration: MessageContainer.animationDuration,
            height: widget.displayDetails ? 20 : 0,
            child: Text(
              widget.message.seen ? "Seen" : "Sent",
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
        if (widget.displaySeen)
          Align(
            alignment: Alignment.centerRight,
            child: CachedCircularImage(
              imageUrl: widget.otherUserAvatar,
              radius: 8,
            ),
          )
        else
          const SizedBox(),
      ],
    );
  }

  double fontSize(String message) {
    return _isAllEmojis(message)
        ? 32
        : sizeForFont(widget.specifics.fontFamily);
  }
}
