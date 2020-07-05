import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/core/util/stickers.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatInput extends StatefulWidget {
  final String otherUserId;
  const ChatInput({Key key, this.otherUserId}) : super(key: key);

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  TextEditingController _controller;
  FocusNode _node;
  StreamSubscription _keyboardVisibilitySubscription;
  bool _showStickers = false;
  bool _showLikeButton = true;
  bool _expandToolBar = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onInput);
    _node = FocusNode()..addListener(_onFocusChange);
    _keyboardVisibilitySubscription =
        KeyboardVisibility.onChange.listen((isVisible) {
      if (isVisible == false) {
        setState(() {
          _expandToolBar = true;
        });
        _node.unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Column(
        children: <Widget>[
          _buildStickerBox(context),
          _buildInputBar(context),
        ],
      ),
    );
  }

  Container _buildInputBar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade800
                    : Colors.grey.shade200)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Button send image
          _buildToolBar(),

          // Edit text
          Flexible(
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    controller: _controller,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 7),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey.shade800
                          : Colors.grey.shade200,
                      hintText: 'Type your message...',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                    focusNode: _node,
                  ),
                ),
              ),
            ),
          ),

          // Button send message
          Material(
            child: _buildActionButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return _showLikeButton
        ? IconButton(
            icon: SvgPicture.asset("assets/images/like.svg",
                color: Colors.blue, width: 26, height: 26),
            onPressed: () => onSendMessage(
                "assets/images/like.svg", MessageType.svg, context),
          )
        : IconButton(
            icon: Icon(
              Icons.send,
              size: 26,
            ),
            onPressed: () =>
                onSendMessage(_controller.text, MessageType.text, context),
            color: Colors.blue,
          );
  }

  Widget _buildStickerBox(BuildContext context) {
    final stickerSize = (MediaQuery.of(context).size.width - 10) / 4;
    if (!_showStickers) {
      return const SizedBox();
    }
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade200
                    : Colors.grey.shade800,
                width: 0.5)),
      ),
      padding: const EdgeInsets.all(5),
      height: 180,
      width: double.infinity,
      child: SingleChildScrollView(
        child: ButtonTheme(
          padding: EdgeInsets.zero,
          child: Wrap(
            children: _buildStickers(stickerSize),
          ),
        ),
      ),
    );
  }

  List<FlatButton> _buildStickers(double size) {
    return _stickerFilePaths()
        .map((path) => FlatButton(
              onPressed: () =>
                  onSendMessage(path, MessageType.sticker, context),
              child: Image.asset(
                path,
                width: size,
                height: size,
                fit: BoxFit.cover,
              ),
            ))
        .toList();
  }

  void _getSticker() {
    // Hide keyboard when sticker appear
    _node.unfocus();
    setState(() {
      _showStickers = !_showStickers;
    });
  }

  Future getImage(BuildContext context) async {
    final imageFile = await getGaleryImage();
    if (imageFile != null) {
      onSendMessage(imageFile.path, MessageType.image, context);
    }
  }

  void onSendMessage(String text, MessageType type, BuildContext context) {
    if (type == MessageType.text) {
      _controller.clear();
    }
    context.bloc<ChatScreenBloc>().add(ChatScreenEvent.sendMessage(Message(
        idFrom: (context.bloc<SplashScreenBloc>().state
                as SplashScreenStateAuthenticated)
            .user
            .uid,
        idTo: widget.otherUserId,
        seen: false,
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        content: text,
        messageId: generateRandomNumString(),
        type: type)));
  }

  List<String> _stickerFilePaths() {
    //dedicated list of stickers in stickers.dart
    return stickers.map((sticker) => "assets/stickers/$sticker.gif").toList();
  }

  void _onFocusChange() {
    if (_node.hasFocus) {
      // Hide sticker and toolbar when keyboard appear
      setState(() {
        _expandToolBar = false;
      });
      closeStickersBox();
    }
  }

  void closeStickersBox() {
    setState(() {
      _showStickers = false;
    });
  }

  void _openCamera() {
    ExtendedNavigator.of(context).pushNamed(Routes.takePictureScreen,
        arguments: TakePictureScreenArguments(onSave: (imagePath) {
      onSendMessage(imagePath, MessageType.image, context);
      ExtendedNavigator.of(context)
          .popUntil((route) => route.settings.name == Routes.chatScreen);
    }));
  }

  Future<bool> _onWillPop(BuildContext context) {
    if (_showStickers) {
      closeStickersBox();
      return Future.value(false);
    }
    context.bloc<ChatScreenBloc>().add(ChatScreenEvent.popScreen((context
            .bloc<SplashScreenBloc>()
            .state as SplashScreenStateAuthenticated)
        .user
        .uid));
    return Future.value(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _node.dispose();
    _keyboardVisibilitySubscription.cancel();
    super.dispose();
  }

  void _onInput() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _expandToolBar = false;
      });
    }
    if (_showLikeButton && _controller.text.isNotEmpty) {
      setState(() {
        _showLikeButton = false;
      });
    } else if (!_showLikeButton && _controller.text.isEmpty) {
      setState(() {
        _showLikeButton = true;
      });
    }
  }

  Widget _buildToolBar() {
    return _expandToolBar
        ? Row(
            children: <Widget>[
              Material(
                child: IconButton(
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.camera_alt,
                    size: 26,
                  ),
                  onPressed: _openCamera,
                  color: Colors.blue,
                ),
              ),
              Material(
                child: IconButton(
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.image,
                    size: 26,
                  ),
                  onPressed: () => getImage(context),
                  color: Colors.blue,
                ),
              ),
              Material(
                child: IconButton(
                  icon: Icon(
                    Icons.tag_faces,
                    size: 26,
                  ),
                  onPressed: _getSticker,
                  color: Colors.blue,
                ),
              ),
            ],
          )
        : Material(
            child: IconButton(
              icon: Icon(
                Icons.chevron_right,
                size: 26,
              ),
              onPressed: () {
                setState(() {
                  _expandToolBar = true;
                });
              },
              color: Colors.blue,
            ),
          );
  }
}
