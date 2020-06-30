import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/settings_screen_bloc/settings_screen_bloc.dart';
import 'package:bubble/core/util/utils.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/router.gr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transparent_image/transparent_image.dart';

class UserInfo extends StatefulWidget {
  final User user;
  final bool modifiable;
  const UserInfo({Key key, this.user, this.modifiable}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingsScreenBloc>()
        ..add(SettingsScreenEvent.requestUserStream(widget.user.uid)),
      child: BlocConsumer<SettingsScreenBloc, SettingsScreenState>(
        listener: (_, state) {
          Fluttertoast.showToast(
              msg: (state as SettingsScreenStateNotify).message);
        },
        listenWhen: (_, state) =>
            state.maybeWhen(notify: (_) => true, orElse: () => false),
        buildWhen: (_, state) =>
            state.maybeWhen(notify: (_) => false, orElse: () => true),
        builder: (context, state) {
          return state.maybeWhen(
              userStreamLoaded: (stream) =>
                  _buildRealTimeUserData(context, stream),
              orElse: () => _buildStaticUserData());
        },
      ),
    );
  }

  Widget _buildStaticUserData() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 20),
        _buildAvatar(widget.user, context),
        _buildName(widget.user.username),
        _buildUID(widget.user),
      ],
    );
  }

  Text _buildName(String name) {
    return Text(
      name,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildRealTimeUserData(BuildContext context, Stream stream) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _buildStaticUserData();
        }
        final realtimeUser =
            User.fromJson((snapshot.data as DocumentSnapshot).data);
        return Column(
          children: <Widget>[
            const SizedBox(height: 20),
            _buildAvatar(realtimeUser, context),
            const SizedBox(height: 10),
            _buildName(realtimeUser.username),
            _buildBio(realtimeUser, context),
            _buildUID(realtimeUser)
          ],
        );
      },
    );
  }

  Wrap _buildBio(User realtimeUser, BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Text(
          realtimeUser.bio.isNotEmpty
              ? realtimeUser.bio
              : widget.modifiable ? "Add your bio here" : "",
          style: TextStyle(
              color: realtimeUser.bio.isNotEmpty ? Colors.blue : Colors.grey,
              fontSize: 16),
        ),
        if (widget.modifiable)
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _onBioEdit(context, realtimeUser),
          )
        else
          const SizedBox(),
      ],
    );
  }

  Stack _buildAvatar(User realtimeUser, BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () => ExtendedNavigator.of(context).pushNamed(Routes.fullPhoto,
              arguments: FullPhotoArguments(
                  url: realtimeUser.imageUrl, title: realtimeUser.username)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: realtimeUser.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (widget.modifiable)
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.75),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.collections,
                    color: Colors.white,
                  ))),
              onPressed: () => _onEditAvatar(context),
            ),
          )
        else
          const SizedBox()
      ],
    );
  }

  Widget _buildUID(User realtimeUser) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "UID: ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(realtimeUser.uid),
        IconButton(
          icon: Icon(Icons.content_copy),
          onPressed: () => _onCopyUid(realtimeUser.uid),
        ),
      ],
    );
  }

  Future<void> _onEditAvatar(BuildContext context) async {
    final imageFile = await getGaleryImage();
    if (imageFile != null) {
      context
          .bloc<SettingsScreenBloc>()
          .add(SettingsScreenEvent.editAvatar(imageFile.path));
    }
  }

  Future<void> _onBioEdit(BuildContext parentContext, User user) async {
    _controller = TextEditingController(text: user.bio);
    await showDialog(
        context: parentContext,
        builder: (context) {
          return AlertDialog(
            title: const Text("Edit your bio"),
            content: TextFormField(
              keyboardType: TextInputType.text,
              controller: _controller,
              decoration: const InputDecoration(helperText: "Your bio here"),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _updateBio(parentContext, _controller.text);
                },
                child: const Text("Update"),
              )
            ],
          );
        });
  }

  void _updateBio(BuildContext context, String text) {
    context
        .bloc<SettingsScreenBloc>()
        .add(SettingsScreenEvent.editBio(widget.user.uid, text));
  }

  @override
  void dispose() {
    if (_controller != null) _controller.dispose();
    super.dispose();
  }

  void _onCopyUid(String content) {
    FlutterClipboardManager.copyToClipBoard(content)
        .then((_) => Fluttertoast.showToast(msg: "copied to clipboard"));
  }
}