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

  @override
  void initState() {
    specifics = widget.initialSpecifics;
    _specificsSubscription = widget.specificsStream.listen((value) {
      specifics = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final roomId = getRoomIdFromUIDHashCode(
        (context.bloc<SplashScreenBloc>().state
                as SplashScreenStateAuthenticated)
            .user
            .uid,
        widget.otherUser.uid);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          specifics.otherUserNickname,
        ),
      ),
      body: SingleChildScrollView(
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
              padding: const EdgeInsets.symmetric(horizontal: 40),
              onPressed: _onEditNickname,
              child: Row(
                children: const <Widget>[
                  Text("\nChange nickname\n",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: const Text(
                "Shared photos",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            BlocProvider(
              create: (_) => getIt<ConversationPhotosShowcaseBloc>()
                ..add(ConversationPhotosShowcaseEvent.loadImages(roomId)),
              child: PhotoShowcase(
                roomId: roomId,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onEditNickname() {
    _userNicknameController =
        TextEditingController(text: specifics.userNickname);
    _otherUserNicknameController =
        TextEditingController(text: specifics.otherUserNickname);
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.SCALE,
      body: Column(
        children: <Widget>[
          const Text("Change nicknames",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: _userNicknameController,
              decoration: const InputDecoration(hintText: "Your nickname here"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: _otherUserNicknameController,
              decoration: InputDecoration(
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
    final updateData = <String, dynamic>{};
    if (_shouldUpdateUserNickname()) {
      updateData["userNickname"] = _userNicknameController.text;
    }
    if (_shouldUpdateOtherUserNickname()) {
      updateData["otherUserNickname"] = _otherUserNicknameController.text;
    }
    if (updateData.isNotEmpty) {
      final currentUser = (context.bloc<SplashScreenBloc>().state
              as SplashScreenStateAuthenticated)
          .user;
      widget.onConversationDataUpdate({
        "userId": currentUser.uid,
        "otherUserId": widget.otherUser.uid,
        "updateData": updateData,
        "merge": true
      });
    }
  }

  bool _shouldUpdateOtherUserNickname() {
    return _otherUserNicknameController.text.isNotEmpty &&
        _otherUserNicknameController.text != specifics.otherUserNickname;
  }

  bool _shouldUpdateUserNickname() {
    return _userNicknameController.text.isNotEmpty &&
        _userNicknameController.text != specifics.userNickname;
  }

  @override
  void dispose() {
    _userNicknameController?.dispose();
    _otherUserNicknameController?.dispose();
    _specificsSubscription.cancel();
    super.dispose();
  }
}
