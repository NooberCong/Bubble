import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/bloc/inflatable_widget_bloc/inflatable_widget_bloc.dart';
import 'package:bubble/core/constants/fonts.dart';
import 'package:bubble/core/constants/stickers.dart';
import 'package:bubble/core/constants/svgs.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/domain/entities/message.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/providers/activity_controller_provider.dart';
import 'package:bubble/frontend/providers/conversation_specifics_provider.dart';
import 'package:bubble/router.gr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giphy_picker/giphy_picker.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({Key key}) : super(key: key);

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  TextEditingController _controller;
  FocusNode _node;
  ConversationSpecifics specifics;
  StreamSubscription _specificsSubscription;
  StreamSubscription _keyboardVisibilitySubscription;
  PersistentBottomSheetController _bottomSheetController;

  //Variable to keep track of which tool bar is active
  //-1 means no toolbar is open, 0 for miscellaneous, 1 for stickerbox
  int _toolbarTabIndex = -1;

  bool _showMainEmoji = true;
  bool _expandToolBar = true;
  String _inputHintText = "Aa";
  Map<String, dynamic> _replyMessageData;
  User user;
  User otherUser;

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
          _inputHintText = "Aa";
        });
        _node.unfocus();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    specifics = ConversationSpecificsProvider.of(context).initialData;
    _specificsSubscription =
        ConversationSpecificsProvider.of(context).stream.listen((value) {
      if (_shouldUpdate(value)) {
        setState(() {
          specifics = value;
        });
      }
    });
    ActivityControllerProvider.of(context)
        .keyboardController
        .addListener(_controller, roomID(context));
    user = chatRoomUser(context);
    otherUser = chatRoomOtherUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InflatableWidgetBloc, InflatableWidgetState>(
      condition: (_, state) =>
          state.maybeWhen(sendEmoji: (_) => true, orElse: () => false),
      listener: (_, state) {
        state.maybeWhen(
            sendEmoji: (size) {
              onSendMessage(
                  "${specifics.mainEmoji}\$SIZE\$${size > 60 ? size : 60}",
                  MessageType.svg);
            },
            orElse: () {});
      },
      child: BlocListener<ChatScreenBloc, ChatScreenState>(
        condition: (_, state) =>
            state.maybeWhen(replying: (_) => true, orElse: () => false),
        listener: _onMessageReply,
        child: WillPopScope(
          onWillPop: () => _onWillPop(context),
          child: Column(
            children: <Widget>[
              Divider(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade800
                    : Colors.grey.shade200,
                thickness: 1,
              ),
              _buildBottomTab(0, _buildMiscellaneousItems),
              _buildBottomTab(1, _buildStickers),
              _buildReplyTab(),
              _buildInputBar()
            ],
          ),
        ),
      ),
    );
  }

  void _onMessageReply(context, state) {
    state.maybeWhen(
        replying: (Map<String, dynamic> data) {
          setState(() {
            _replyMessageData = data;
          });
        },
        orElse: () {});
  }

  Container _buildInputBar() {
    return Container(
      width: double.infinity,
      height: 50.0,
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
                      hintText: _inputHintText,
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 16),
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
    return _showMainEmoji
        ? GestureDetector(
            onLongPressStart: (_) {
              _animateInflableEmoji();
            },
            onLongPressEnd: (_) {
              _sendInflatedEmoji();
            },
            child: IconButton(
              icon: SvgPicture.asset(specifics.mainEmoji,
                  color: colorForSvg(
                      specifics.mainEmoji, Color(specifics.themeColorCode)),
                  width: 26,
                  height: 26),
              onPressed: () {
                _controller.clear();
                onSendMessage(
                    "${specifics.mainEmoji}\$SIZE\$60", MessageType.svg);
              },
            ),
          )
        : IconButton(
            icon: Icon(
              Icons.send,
              size: 26,
            ),
            onPressed: () {
              if (isNotEmpty(_controller.text)) {
                onSendMessage(
                    _controller.text,
                    isUrl(_controller.text)
                        ? MessageType.url
                        : MessageType.text);
              }
            },
            color: Color(specifics.themeColorCode),
          );
  }

  Widget _buildBottomTab(
      int tabIndex, List<Widget> Function(BoxConstraints) itemBuilder) {
    if (_toolbarTabIndex != tabIndex) {
      return const SizedBox();
    }
    return Container(
      padding: const EdgeInsets.all(5),
      height: 180,
      width: double.infinity,
      child: SingleChildScrollView(
        child: ButtonTheme(
          padding: EdgeInsets.zero,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                children: itemBuilder(constraints),
              );
            },
          ),
        ),
      ),
    );
  }

  List<FlatButton> _buildStickers(BoxConstraints constraints) {
    final size = constraints.maxWidth / 4;
    return _stickerFilePaths()
        .map((path) => FlatButton(
              onPressed: () => onSendMessage(path, MessageType.sticker),
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
    setState(() {
      _toolbarTabIndex = _toolbarTabIndex != 1 ? 1 : -1;
    });
  }

  Future getImage() async {
    final imageFile = await getGaleryImage();
    if (imageFile != null) {
      onSendMessage(imageFile.path, MessageType.image);
    }
  }

  void onSendMessage(String text, MessageType type) {
    if (type == MessageType.text || type == MessageType.url) {
      _controller.clear();
    }
    context.bloc<ChatScreenBloc>().add(ChatScreenEvent.sendMessage(Message(
        idFrom: user.uid,
        idTo: otherUser.uid,
        referenceTo: _replyMessageData,
        seen: false,
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        content: text,
        type: type)));
    if (_replyMessageData != null) {
      _clearReply();
    }
  }

  void _clearReply() {
    setState(() {
      _replyMessageData = null;
    });
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
        _inputHintText = "Type your message here...";
        _toolbarTabIndex = -1;
      });
    }
  }

  void _openCamera() {
    ExtendedNavigator.of(context).pushNamed(Routes.takePictureScreen,
        arguments: TakePictureScreenArguments(onSave: (imagePath) {
      onSendMessage(imagePath, MessageType.image);
      ExtendedNavigator.of(context)
          .popUntil((route) => route.settings.name == Routes.chatScreen);
    }));
  }

  Future<bool> _onWillPop(BuildContext context) async {
    if (_toolbarTabIndex != -1) {
      if (_bottomSheetController != null) {
        _disposeBottomSheet();
      } else {
        setState(() {
          _toolbarTabIndex = -1;
        });
      }
      return false;
    }
    return true;
  }

  void _disposeBottomSheet() {
    _bottomSheetController.close();
    setState(() {
      _bottomSheetController = null;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    _node?.dispose();
    _keyboardVisibilitySubscription?.cancel();
    _specificsSubscription?.cancel();
    _bottomSheetController?.close();
    super.dispose();
  }

  void _onInput() {
    final notEmpty = isNotEmpty(_controller.text);
    if (notEmpty) {
      setState(() {
        _expandToolBar = false;
      });
    }
    if (_showMainEmoji && notEmpty) {
      setState(() {
        _showMainEmoji = false;
      });
    } else if (!_showMainEmoji && notEmpty == false) {
      setState(() {
        _showMainEmoji = true;
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
                  icon: SvgPicture.asset(
                    "assets/images/more.svg",
                    height: 26,
                    width: 26,
                    color: Color(specifics.themeColorCode),
                  ),
                  onPressed: () {
                    setState(() {
                      _toolbarTabIndex = _toolbarTabIndex != 0 ? 0 : -1;
                    });
                  },
                ),
              ),
              Material(
                child: IconButton(
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.camera_alt,
                    size: 26,
                  ),
                  onPressed: _openCamera,
                  color: Color(specifics.themeColorCode),
                ),
              ),
              Material(
                child: IconButton(
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.image,
                    size: 26,
                  ),
                  onPressed: getImage,
                  color: Color(specifics.themeColorCode),
                ),
              ),
              Material(
                child: IconButton(
                  icon: Icon(
                    Icons.tag_faces,
                    size: 26,
                  ),
                  onPressed: _getSticker,
                  color: Color(specifics.themeColorCode),
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
              color: Color(specifics.themeColorCode),
            ),
          );
  }

  List<Widget> _buildColorPicker() {
    return [
      MaterialColorPicker(
        allowShades: false,
        colors: [
          Colors.green,
          Colors.amber,
          Colors.cyan,
          Colors.indigo,
          Colors.blue,
          Colors.orange,
          Colors.pink,
          Colors.teal
        ],
        circleSize: MediaQuery.of(context).size.width / 6,
        spacing: 5,
        elevation: 1,
        shrinkWrap: true,
        onMainColorChange: (value) => _updateConversationData(
            {"themeColorCode": value.value}, user.uid != otherUser.uid),
        selectedColor: Color(specifics.themeColorCode),
      )
    ];
  }

  bool _shouldUpdate(ConversationSpecifics newValue) {
    return specifics.mainEmoji != newValue.mainEmoji ||
        specifics.themeColorCode != newValue.themeColorCode ||
        specifics.fontFamily != newValue.fontFamily;
  }

  void _updateConversationData(
      Map<String, dynamic> updateData, bool shouldMerge) {
    context.bloc<ChatScreenBloc>().add(ChatScreenEvent.updateConversationData({
          "otherUserId": otherUser.uid,
          "userId": user.uid,
          //Only merge data on both user conversation when user is not chatting with his own account!
          "merge": shouldMerge,
          "updateData": updateData
        }));
  }

  List<Widget> _buildMiscellaneousItems(BoxConstraints constraints) {
    final size = (constraints.maxWidth - 30 * 4) / 4;
    return [
      FlatButton(
        padding: const EdgeInsets.all(10),
        onPressed: () => _showBottomItemsMenu(_buildColorPicker),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/color-wheel.svg",
              width: size,
              height: size,
            ),
            const SizedBox(height: 5),
            const Text("Color Theme")
          ],
        ),
      ),
      FlatButton(
        padding: const EdgeInsets.all(10),
        onPressed: () => _showBottomItemsMenu(_buildMainEmojis),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              specifics.mainEmoji,
              width: size,
              height: size,
              color: colorForSvg(
                  specifics.mainEmoji, Color(specifics.themeColorCode)),
            ),
            const SizedBox(height: 5),
            const Text("Main emoji")
          ],
        ),
      ),
      FlatButton(
        padding: const EdgeInsets.all(10),
        onPressed: () => _showBottomItemsMenu(_buildFonts),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/font.svg",
              width: size,
              height: size,
            ),
            const SizedBox(height: 5),
            const Text("Custom font")
          ],
        ),
      ),
      FlatButton(
        padding: const EdgeInsets.all(10),
        onPressed: _pickGif,
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/gif.svg",
              width: size,
              height: size,
            ),
            const SizedBox(height: 5),
            const Text("Send gifs")
          ],
        ),
      ),
    ];
  }

  void _showBottomItemsMenu(List<Widget> Function() itemBuilder) {
    setState(() {
      _bottomSheetController = (Scaffold.of(context).showBottomSheet(
        (context) => SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Wrap(children: itemBuilder()),
              FlatButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _bottomSheetController = null;
                  });
                },
                child: const Text(
                  "Close",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ),
      ))
        ..closed.then((_) => setState(() {
              _bottomSheetController = null;
            }));
    });
  }

  List<Widget> _buildMainEmojis() {
    final emojiSize = MediaQuery.of(context).size.width / 6;
    return svgs
        .map(
          (svg) => FlatButton(
            color:
                svg == specifics.mainEmoji ? Colors.grey.withOpacity(.5) : null,
            padding: const EdgeInsets.all(10),
            onPressed: () => _updateConversationData({"mainEmoji": svg}, true),
            child: SvgPicture.asset(svg,
                width: emojiSize,
                height: emojiSize,
                color: colorForSvg(svg, Color(specifics.themeColorCode))),
          ),
        )
        .toList();
  }

  List<Widget> _buildFonts() {
    return fonts
        .map(
          (font) => FlatButton(
            color: font == specifics.fontFamily
                ? Colors.grey.withOpacity(.5)
                : null,
            padding: const EdgeInsets.all(10),
            onPressed: () {
              _updateConversationData({"fontFamily": font}, false);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$font font family demo",
                  style:
                      TextStyle(fontSize: sizeForFont(font), fontFamily: font),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  Widget _buildReplyTab() {
    return _replyMessageData != null
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 5,
                    ),
                    Text("Replying to ${_receiver()}",
                        style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 5,
                    ),
                    _buildMessagePreview(),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: _clearReply,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey.shade700
                          : Colors.grey.shade300),
                  child: Icon(
                    Icons.clear,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          )
        : const SizedBox();
  }

  String _receiver() {
    return _replyMessageData["messageOwner"] == otherUser.uid
        ? specifics.nicknames[otherUser.uid] as String
        : "myself";
  }

  Widget _buildMessagePreview() {
    final messageType =
        Message.parseType(_replyMessageData["messageType"] as String);
    switch (messageType) {
      case MessageType.url:
      case MessageType.text:
        return Text(
          _replyMessageData["content"] as String,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(color: Colors.grey.shade500),
        );
        break;
      case MessageType.image:
      case MessageType.gif:
        return CachedNetworkImage(
          height: 50,
          width: 50,
          fit: BoxFit.cover,
          imageUrl: _replyMessageData["content"] as String,
        );
        break;
      case MessageType.sticker:
        return Image.asset(_replyMessageData["content"] as String,
            width: 50, height: 50, fit: BoxFit.cover);
        break;
      case MessageType.svg:
        return SvgPicture.asset(
          parseSvg(_replyMessageData["content"] as String),
          width: 50,
          height: 50,
        );
        break;
      default:
        return const SizedBox();
    }
  }

  Future<void> _pickGif() async {
    final gif = await GiphyPicker.pickGif(
        context: context,
        apiKey: "8bMEIISwiZDn3mDCootYKQqNfWJ3TScO",
        showPreviewPage: false);
    if (gif != null) {
      onSendMessage(gif.images.original.url, MessageType.gif);
    }
  }

  void _animateInflableEmoji() {
    context
        .bloc<InflatableWidgetBloc>()
        .add(InflatableWidgetEvent.startAnimation());
  }

  void _sendInflatedEmoji() {
    context
        .bloc<InflatableWidgetBloc>()
        .add(InflatableWidgetEvent.onLongPressRelease());
  }
}
