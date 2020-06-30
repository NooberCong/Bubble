import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/user_info.dart';
import 'package:flutter/material.dart';

class OtherUserInfoScreen extends StatelessWidget {
  final User user;
  const OtherUserInfoScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          user.username,
        ),
      ),
      body: Column(
        children: <Widget>[
          UserInfo(
            user: user,
            modifiable: false,
          ),
        ],
      ),
    );
  }
}
