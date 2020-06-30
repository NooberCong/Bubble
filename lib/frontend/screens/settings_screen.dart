import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/action_menu.dart';
import 'package:bubble/frontend/widgets/user_info.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final User user;
  const SettingsScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Me"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserInfo(
              user: user,
              modifiable: true,
            ),
            ActionMenu(user: user),
          ],
        ),
      ),
    );
  }
}
