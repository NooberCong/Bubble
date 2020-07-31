import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bubble/backend/download_manager.dart';
import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/core/constants/fonts.dart';
import 'package:bubble/core/constants/svgs.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:bubble/frontend/widgets/cached_image.dart';
import 'package:bubble/frontend/widgets/message_preview.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';
import 'package:flutter_link_preview/flutter_link_preview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

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
  //Key used to obtain render widget of MessagePreview widget(if needed)
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
    return Align(
      alignment:
          widget.isFromUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          _buildReferencedMessage(),
          Padding(
            padding: _padding(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildAvatar(),
                _buildMessage(),
              ],
            ),
          ),
          _buildReactions(),
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
            onDoubleTap: _replyToMessage,
            onLongPress: _showMessageActions,
            child: _messageIsRemoved()
                ? _buildEmptyMessage(borderRadius)
                : _buildBasedOnType(borderRadius, boxConstraints)));
  }

  bool _messageIsRemoved() => widget.message.content.isEmpty;

  void _onMessageTap() {
    if (_messageIsRemoved()) {
      //Do nothing
    } else if (widget.message.type == MessageType.image) {
      _viewImage();
    } else if (widget.message.type == MessageType.url) {
      _launchUrl();
    } else {
      widget.showDetails();
    }
  }

  Widget _buildBasedOnType(
      BorderRadius borderRadius, BoxConstraints boxConstraints) {
    switch (widget.message.type) {
      case MessageType.url:
        return _buildUrlPreview(borderRadius, boxConstraints);
      case MessageType.text:
        return _buildText(borderRadius, boxConstraints);
      case MessageType.image:
      case MessageType.gif:
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
            ? Theme.of(context).primaryColor
            : widget.isFromUser
                ? Color(widget.specifics.themeColorCode)
                : Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade800
                    : Colors.grey.shade300)
        .withOpacity(widget.displayDetails ? .75 : 1);
  }

  bool _isAllEmojis(String content) =>
      content.length >= 2 * content.runes.length;

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
    final hasNoReaction = _noReactionRecorded();
    return EdgeInsets.only(
        top: _paddingToFitReferenceMessage() + (hasNoReaction ? 0 : 8),
        bottom: hasNoReaction ? 8 : 25);
  }

  void _viewImage() {
    ExtendedNavigator.of(context).pushNamed(Routes.fullPhoto,
        arguments: FullPhotoArguments(
            url: widget.message.content, title: "Photo view"));
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
            child: widget.message.seen
                ? CachedCircularImage(
                    imageUrl: widget.otherUserAvatar,
                    radius: 8,
                  )
                : Container(
                    padding: const EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.grey,
                      size: 10,
                    ),
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

  void _showMessageActions() {
    final reactions = Message.defaultReactionsValue.keys.toList();
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.NO_HEADER,
      body: LayoutBuilder(
        builder: (bcontext, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: List.generate(
                    reactions.length,
                    (index) => InkWell(
                          onTap: () {
                            final user = currentUser(context);
                            context
                                .bloc<ChatScreenBloc>()
                                .add(ChatScreenEvent.reactToMessage({
                                  "reaction": reactions[index],
                                  "messageId": widget.message.messageId,
                                  "username": widget.specifics.nicknames[
                                      widget.isFromUser
                                          ? widget.message.idFrom
                                          : widget.message.idTo],
                                  "imageUrl": user.imageUrl,
                                  "uid": user.uid,
                                  "roomId": _roomid()
                                }));
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          child: Container(
                            width: constraints.maxWidth / 7,
                            padding: const EdgeInsets.all(7),
                            child: Text(
                              reactions[index],
                              style: const TextStyle(fontSize: 22),
                            ),
                          ),
                        )),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _replyToMessage();
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: SizedBox(
                      width: constraints.maxWidth / 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.reply,
                            size: 32,
                            color: Colors.grey,
                          ),
                          const Text("Reply",
                              style: TextStyle(color: Colors.grey)),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  _dynamicButton(context, constraints),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: constraints.maxWidth / 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.forward,
                            size: 32,
                            color: Colors.grey,
                          ),
                          const Text("Forward",
                              style: TextStyle(color: Colors.grey)),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (widget.isFromUser) {
                        _deleteMessage();
                      }
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: SizedBox(
                      width: constraints.maxWidth / 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.delete,
                            size: 32,
                            color: Colors.grey,
                          ),
                          const Text("Delete",
                              style: TextStyle(color: Colors.grey)),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    ).show();
  }

  void _deleteMessage() {
    return context.bloc<ChatScreenBloc>().add(ChatScreenEvent.deleteMessage(
        {"roomId": _roomid(), "messageId": widget.message.messageId}));
  }

  InkWell _dynamicButton(BuildContext context, BoxConstraints boxConstraints) {
    final messageIsImage = widget.message.type == MessageType.image;
    return InkWell(
      onTap: () {
        if (widget.message.type == MessageType.text ||
            widget.message.type == MessageType.url) {
          FlutterClipboardManager.copyToClipBoard(widget.message.content);
          Fluttertoast.showToast(msg: "Message copied");
        } else if (messageIsImage) {
          DownloadManager.enqueDownload(widget.message.content);
        }
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: SizedBox(
        width: boxConstraints.maxWidth / 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            Icon(
              Icons.content_copy,
              size: 32,
              color: Colors.grey,
            ),
            Text(messageIsImage ? "Download" : "Copy",
                style: const TextStyle(color: Colors.grey)),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  String _roomid() {
    return getRoomIdFromUIDHashCode(widget.message.idFrom, widget.message.idTo);
  }

  Widget _buildReactions() {
    if (widget.message.reactions.isEmpty || _noReactionRecorded()) {
      return const SizedBox();
    }
    return Positioned(
      bottom: 8,
      right: 0,
      child: GestureDetector(
        onTap: () {
          final allReactions = <dynamic>[];
          for (final entry in widget.message.reactions.entries) {
            allReactions.addAll((entry.value as List<dynamic>).map((record) {
              final reaction = entry.key;
              record["emoji"] = reaction;
              return record;
            }).toList());
          }
          AwesomeDialog(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              dialogType: DialogType.NO_HEADER,
              context: context,
              body: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Reactions",
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    )
                  ],
                ),
                ...allReactions
                    .map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CachedCircularImage(
                                  radius: 20,
                                  imageUrl: e["imageUrl"] as String,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 210,
                                  child: Text(
                                    e["username"] as String,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(e["emoji"] as String)),
                          ],
                        ))
                    .toList(),
              ])).show();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Theme.of(context).primaryColor, width: 1),
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade100
                : Colors.grey.shade800,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: _listNonEmptyReactionEmojis()..add(_totalReactions()),
          ),
        ),
      ),
    );
  }

  bool _noReactionRecorded() {
    return !widget.message.reactions.values
        .any((element) => (element as List<dynamic>).isNotEmpty);
  }

  List<Widget> _listNonEmptyReactionEmojis() {
    return widget.message.reactions.entries
        .where((element) => (element.value as List<dynamic>).isNotEmpty)
        .map((e) => Text(e.key))
        .toList();
  }

  Widget _totalReactions() {
    int total = 0;
    for (final userReactions in widget.message.reactions.values) {
      total += (userReactions as List<dynamic>).length;
    }
    return Text(total > 1 ? total.toString() : "");
  }

  Widget _buildUrlPreview(
      BorderRadius borderRadius, BoxConstraints boxConstraints) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: _boxColor(context, widget.message.content)),
      constraints: boxConstraints,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              widget.message.content,
              style: TextStyle(
                color: _textColor(context),
                fontFamily: widget.specifics.fontFamily,
                decoration: TextDecoration.underline,
                fontSize: fontSize(
                  widget.specifics.fontFamily,
                ),
              ),
            ),
          ),
          FlutterLinkPreview(
            url: parseUrl(widget.message.content),
            builder: (InfoBase ib) {
              final wInfo = ib as WebInfo;
              return wInfo != null
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade100
                          : Colors.white,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CachedNetworkImage(
                                imageUrl: wInfo.icon,
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                        "assets/images/img_not_available.jpeg"),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth: boxConstraints.maxWidth - 70),
                                child: Text(
                                  wInfo.title ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          Text(wInfo.description ?? "",
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    )
                  : const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    final url = parseUrl(widget.message.content);
    if (await canLaunch(url)) {
      launch(url);
    }
  }

  void _replyToMessage() {
    context.bloc<ChatScreenBloc>().add(ChatScreenEvent.setReplyToMessage({
          "messageType": widget.message.type.toString(),
          "content": widget.message.content,
          "messageOwner": widget.message.idFrom,
          "roomId": _roomid(),
          "messageId": widget.message.messageId
        }));
  }

  Widget _buildReferencedMessage() {
    if (widget.message.referenceTo == null) {
      return const SizedBox();
    }
    return Positioned(
      right: widget.isFromUser ? 10 : null,
      left: !widget.isFromUser ? 35 : null,
      // left: ,
      child: Column(
        crossAxisAlignment: widget.isFromUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.reply,
                size: 18,
              ),
              const SizedBox(
                width: .5,
              ),
              Text(
                  "Replied to ${widget.message.referenceTo['messageOwner'] != currentUser(context).uid ? widget.specifics.nicknames[widget.message.referenceTo['messageOwner']] : 'me'}"),
            ],
          ),
          MessagePreview(
            referredMessageData: widget.message.referenceTo,
            specifics: widget.specifics,
          ),
        ],
      ),
    );
  }

  double _paddingToFitReferenceMessage() {
    if (widget.message.referenceTo == null) {
      return 0;
    }
    switch (Message.parseType(
        widget.message.referenceTo["messageType"] as String)) {
      case MessageType.image:
        return 120;
      case MessageType.sticker:
        return 65;
      case MessageType.svg:
        return 65;
      case MessageType.text:
      case MessageType.url:
        return 40;
      default:
        return 0;
    }
  }

  Widget _buildEmptyMessage(BorderRadius borderRadius) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(
            color: grey(context),
          )),
      child: Text("Message removed",
          style: TextStyle(
              fontFamily: widget.specifics.fontFamily,
              color: grey(context),
              fontSize: fontSize("Message removed"))),
    );
  }
}
