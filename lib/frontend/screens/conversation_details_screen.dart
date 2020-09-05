import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bubble/bloc/photo_showcase_bloc/conversation_photos_showcase_bloc.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/photo_showcase.dart';
import 'package:bubble/frontend/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConversationDetailsScreen extends StatefulWidget {
  final User otherUser;
  final ConversationSpecifics initialSpecifics;
  final Stream<ConversationSpecifics> specificsStream;
  final void Function(Map<String, dynamic>) onConversationDataUpdate;
  const ConversationDetailsScreen(
      {Key key,
      this.otherUser,
      this.specificsStream,
      this.initialSpecifics,
      this.onConversationDataUpdate})
      : super(key: key);

  @override
  _ConversationDetailsScreenState createState() =>
      _ConversationDetailsScreenState();
}

class _ConversationDetailsScreenState extends State<ConversationDetailsScreen> {
  ConversationSpecifics specifics;
  TextEditingController _userNicknameController;
  TextEditingController _otherUserNicknameController;
  StreamSubscription _specificsSubscription;
  bool _canLoadMore = true;
  bool _isLoading = false;
  ScrollController _controller;
  String roomId;
  User user;

  @override
  void initState() {
    specifics = widget.initialSpecifics;
    _specificsSubscription = widget.specificsStream.listen((value) {
      setState(() {
        specifics = value;
      });
    });
    user = (context.bloc<SplashScreenBloc>().state
            as SplashScreenStateAuthenticated)
        .user;
    roomId = getRoomIdFromUIDHashCode(widget.otherUser.uid, user.uid);
    _controller = ScrollController(keepScrollOffset: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          specifics.nicknames[widget.otherUser.uid] as String,
        ),
      ),
      body: BlocProvider<ConversationPhotosShowcaseBloc>(
        create: (_) => getIt<ConversationPhotosShowcaseBloc>()
          ..add(ConversationPhotosShowcaseEvent.loadImages(roomId)),
        child: BlocListener<ConversationPhotosShowcaseBloc,
            ConversationPhotosShowcaseState>(
          listener: (context, state) {
            state.maybeWhen(
                error: (msg) => Fluttertoast.showToast(msg: msg),
                endReached: () {
                  setState(() {
                    _canLoadMore = false;
                  });
                },
                loading: () {
                  setState(() {
                    _isLoading = true;
                  });
                },
                loaded: (_) {
                  setState(() {
                    _isLoading = false;
                  });
                },
                orElse: () {});
          },
          child: Builder(
            builder: (context) {
              // ignore: invalid_use_of_protected_member
              if (!_controller.hasListeners) {
                _initializeController(context);
              }
              return SingleChildScrollView(
                controller: _controller,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    UserInfo(
                      user: widget.otherUser,
                      modifiable: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      onPressed: _onEditNickname,
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/images/name.svg",
                            width: 30,
                            height: 30,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                          ),
                          const Text("\t\tChange nicknames",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "\t\t\t\tShared photos",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    PhotoShowcase(
                      roomId: roomId,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (_isLoading)
                      const CircularProgressIndicator()
                    else
                      const SizedBox()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _initializeController(BuildContext context) {
    _controller.addListener(() {
      _onScroll(context);
    });
  }

  void _onEditNickname() {
    _userNicknameController =
        TextEditingController(text: specifics.nicknames[user.uid] as String);
    _otherUserNicknameController = TextEditingController(
        text: specifics.nicknames[widget.otherUser.uid] as String);
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.SCALE,
      body: Column(
        children: <Widget>[
          const Text("Nicknames",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: _userNicknameController,
              decoration: const InputDecoration(
                  labelText: "User nickname", hintText: "Your nickname here"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: _otherUserNicknameController,
              decoration: InputDecoration(
                  labelText: "${widget.otherUser.username}'s nickname",
                  hintText: "${widget.otherUser.username} nickname here"),
            ),
          ),
        ],
      ),
      btnCancelText: "Cancel",
      btnOkText: "Update",
      btnCancelOnPress: () {},
      useRootNavigator: true,
      btnOkOnPress: _onUpdateNickname,
    ).show();
  }

  void _onUpdateNickname() {
    var hasChange = false;
    final updateData = {"nicknames": specifics.nicknames};
    if (_shouldUpdateUserNickname()) {
      updateData["nicknames"][user.uid] = _userNicknameController.text;
      hasChange = true;
    }
    if (_shouldUpdateOtherUserNickname()) {
      updateData["nicknames"][widget.otherUser.uid] =
          _otherUserNicknameController.text;
      hasChange = true;
    }
    if (hasChange) {
      widget.onConversationDataUpdate({
        "userId": user.uid,
        "otherUserId": widget.otherUser.uid,
        "updateData": updateData,
        "merge": true
      });
    }
  }

  bool _shouldUpdateOtherUserNickname() {
    return _otherUserNicknameController.text.isNotEmpty &&
        _otherUserNicknameController.text !=
            specifics.nicknames[widget.otherUser.uid];
  }

  bool _shouldUpdateUserNickname() {
    return _userNicknameController.text.isNotEmpty &&
        _userNicknameController.text != specifics.nicknames[user.uid];
  }

  void _onScroll(BuildContext context) {
    if (_reachedBottom() && _canLoadMore) {
      context
          .bloc<ConversationPhotosShowcaseBloc>()
          .add(ConversationPhotosShowcaseEvent.loadImages(roomId));
    }
  }

  bool _reachedBottom() {
    return _controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange;
  }

  @override
  void dispose() {
    _controller?.dispose();
    _userNicknameController?.dispose();
    _otherUserNicknameController?.dispose();
    _specificsSubscription?.cancel();
    super.dispose();
  }
}
