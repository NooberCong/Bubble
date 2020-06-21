import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/find_user_screen_bloc/find_user_screen_bloc.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/find_user_actions.dart';
import 'package:bubble/router.gr.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindUserScreen extends StatelessWidget {
  final User user;
  const FindUserScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Start a conversation",
            style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xffF5F9FA),
      ),
      body: BlocProvider(
        create: (_) => getIt<FindUserScreenBloc>(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const FindUserActions(),
              Expanded(
                child: BlocBuilder<FindUserScreenBloc, FindUserScreenState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      loaded: (otherUser) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          DashedCircle(
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    NetworkImage(otherUser.imageUrl),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(otherUser.username,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(user.bio),
                          RaisedButton(
                            color: Colors.blue,
                            onPressed: () {
                              _addConversation(context, otherUser);
                              _navigateToChatScreen(context, otherUser);
                            },
                            child: Text("Start a conversation",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      error: (message) => Center(
                        child: Text(message),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToChatScreen(BuildContext context, User otherUser) {
    ExtendedNavigator.of(context).pushNamed(Routes.chatScreen,
        arguments: ChatScreenArguments(user: user, otherUser: otherUser));
  }

  void _addConversation(BuildContext context, User otherUser) {
    context
        .bloc<FindUserScreenBloc>()
        .add(FindUserScreenEvent.startConveration(user, otherUser));
  }
}