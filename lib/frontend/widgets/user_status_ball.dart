import 'package:bubble/bloc/user_status_ball_bloc/user_status_ball_bloc.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/user_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserStatusBall extends StatelessWidget {
  final String uid;
  final bool showText;
  const UserStatusBall({Key key, this.uid, this.showText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserStatusBallBloc>()
        ..add(UserStatusBallEvent.requestPeerStatus(uid)),
      child: BlocBuilder<UserStatusBallBloc, UserStatusBallState>(
        builder: (BuildContext context, UserStatusBallState state) {
          return state.maybeWhen(
              userStatusStreamLoaded: (statusStream) => Row(
                    children: <Widget>[
                      _buildStatusBall(statusStream, context),
                    ],
                  ),
              orElse: () => const SizedBox());
        },
      ),
    );
  }

  Container _buildStatusBall(Stream statusStream, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor, shape: BoxShape.circle),
      child: StreamBuilder(
        stream: statusStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userStatus = snapshot.data as UserStatus;
            return Row(
              children: <Widget>[
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: _color(userStatus.isOnline),
                      shape: BoxShape.circle),
                ),
                _showLastActive(userStatus)
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _showLastActive(UserStatus userStatus) {
    return showText
        ? userStatus.isOnline
            ? Text("  Active",
                style: TextStyle(color: Colors.grey, fontSize: 12))
            : Text(
                "  ${userStatus.lastActive}",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              )
        : const SizedBox();
  }

  Color _color(bool isOnline) {
    return isOnline ? Colors.green : Colors.grey;
  }
}
