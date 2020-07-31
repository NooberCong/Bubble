import 'package:bubble/core/util/utils.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';

class MessagePreview extends StatefulWidget {
  final ConversationSpecifics specifics;
  final Map<String, dynamic> referredMessageData;
  const MessagePreview({Key key, this.referredMessageData, this.specifics})
      : super(key: key);

  @override
  _MessagePreviewState createState() => _MessagePreviewState();
}

class _MessagePreviewState extends State<MessagePreview> {
  @override
  Widget build(BuildContext context) {
    final boxConstraints = BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 3.5,
        maxHeight: MediaQuery.of(context).size.width / 3.5);
    return (widget.referredMessageData["content"] as String).isNotEmpty
        ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _boxColor(context)),
            constraints: boxConstraints,
            clipBehavior: Clip.hardEdge,
            child: _buildMessageType())
        : _buildEmptyPreview(boxConstraints);
  }

  Widget _buildMessageType() {
    final messageType =
        Message.parseType(widget.referredMessageData["messageType"] as String);
    switch (messageType) {
      case MessageType.image:
      case MessageType.gif:
        return CachedNetworkImage(
            placeholder: (_, __) => Image.memory(kTransparentImage),
            fit: BoxFit.cover,
            width: 120,
            height: 120,
            errorWidget: (_, __, ___) =>
                Image.asset("assets/images/img_not_available.jpeg"),
            imageUrl: widget.referredMessageData["content"] as String);
      case MessageType.svg:
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            widget.referredMessageData["content"] as String,
            width: 40,
            height: 40,
          ),
        );
      case MessageType.sticker:
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            widget.referredMessageData["content"] as String,
            width: 40,
            height: 40,
          ),
        );
      case MessageType.text:
      case MessageType.url:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Text(
            widget.referredMessageData["content"] as String,
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        );
      default:
        return const SizedBox();
    }
  }

  Color _boxColor(BuildContext context) {
    final isFromUser =
        currentUser(context).uid == widget.referredMessageData["messageOwner"];
    return isFromUser
        ? Color(widget.specifics.themeColorCode).withOpacity(.5)
        : Colors.grey.shade500.withOpacity(.5);
  }

  Widget _buildEmptyPreview(BoxConstraints constraints) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: grey(context))),
      constraints: constraints,
      child: Text(
        "Removed",
        style: TextStyle(
          fontFamily: widget.specifics.fontFamily,
          color: grey(context),
        ),
      ),
    );
  }
}
