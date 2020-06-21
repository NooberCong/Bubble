import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/core/util/stickers.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChatInput extends StatefulWidget {
  final String otherUserId;
  const ChatInput({Key key, this.otherUserId}) : super(key: key);

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _controller = TextEditingController();
  final _node = FocusNode();
  bool _showStickers = false;

  @override
  void initState() {
    super.initState();
    _node.addListener(_onFocusChange);
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
          border: Border(top: BorderSide(color: Colors.grey[200], width: 0.5)),
          color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Button send image
          IconButton(
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.image,
              size: 26,
            ),
            onPressed: () => getImage(context),
            color: Colors.blue,
          ),
          IconButton(
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.tag_faces,
              size: 26,
            ),
            onPressed: _getSticker,
            color: Colors.blue,
          ),

          // Edit text
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                  controller: _controller,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 7),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Type your message...',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                  focusNode: _node,
                ),
              ),
            ),
          ),

          // Button send message
          IconButton(
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.send,
              size: 26,
            ),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _onSendMessage(_controller.text, MessageType.text, context);
              }
            },
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildStickerBox(BuildContext context) {
    if (!_showStickers) {
      return const SizedBox();
    }
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey[200], width: 0.5)),
          color: Colors.white),
      padding: const EdgeInsets.all(5.0),
      height: 180.0,
      width: double.infinity,
      child: Wrap(
        children: _buildStickers(),
      ),
    );
  }

  List<FlatButton> _buildStickers() {
    return _stickerFilePaths()
        .map((path) => FlatButton(
              onPressed: () =>
                  _onSendMessage(path, MessageType.sticker, context),
              child: Image.asset(
                path,
                width: 65,
                height: 65,
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
    final imgPicker = ImagePicker();
    final imageFile = await imgPicker.getImage(source: ImageSource.gallery);
    if (imageFile != null) {
      _onSendMessage(imageFile.path, MessageType.image, context);
    }
  }

  void _onSendMessage(String text, MessageType type, BuildContext context) {
    if (type == MessageType.text) {
      _controller.clear();
    }
    context.bloc<ChatScreenBloc>().add(ChatScreenEvent.sendMessage(Message(
        idFrom: (context.bloc<SplashScreenBloc>().state
                as SplashScreenStateAuthenticated)
            .user
            .uid,
        idTo: widget.otherUserId,
        content: text,
        type: type)));
  }

  List<String> _stickerFilePaths() {
    //dedicated list of stickers in stickers.dart
    return stickers.map((sticker) => "assets/stickers/$sticker.gif").toList();
  }

  void _onFocusChange() {
    if (_node.hasFocus) {
      // Hide sticker when keyboard appear
      closeStickersBox();
    }
  }

  void closeStickersBox() {
    setState(() {
      _showStickers = false;
    });
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
    super.dispose();
  }
}
