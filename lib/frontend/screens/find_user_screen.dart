import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/find_user_screen_bloc/find_user_screen_bloc.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/cached_image.dart';
import 'package:bubble/frontend/widgets/find_user_actions.dart';
import 'package:bubble/router.gr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FindUserScreen extends StatefulWidget {
  final User user;
  const FindUserScreen({Key key, this.user}) : super(key: key);

  @override
  _FindUserScreenState createState() => _FindUserScreenState();
}

class _FindUserScreenState extends State<FindUserScreen> {
  bool _creatingConversation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Start a conversation",
        ),
      ),
      body: BlocProvider(
        create: (_) => getIt<FindUserScreenBloc>(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const FindUserActions(),
              Expanded(
                child: BlocConsumer<FindUserScreenBloc, FindUserScreenState>(
                  listenWhen: (_, state) => state.maybeWhen(
                      conversationCreated: (_) => true,
                      notification: (_) => true,
                      orElse: () => false),
                  listener: (context, state) {
                    state.maybeWhen(
                        conversationCreated: (data) {
                          _navigateToChatScreen(context, data);
                          setState(() {
                            _creatingConversation = false;
                          });
                        },
                        notification: (msg) {
                          Fluttertoast.showToast(msg: msg);
                        },
                        orElse: () {});
                  },
                  buildWhen: (_, state) => state.maybeWhen(
                      conversationCreated: (_) => false,
                      notification: (_) => false,
                      processing: () => false,
                      orElse: () => true),
                  builder: (context, state) {
                    return state.maybeWhen(
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
                                    child: CachedCircularImage(
                                      imageUrl: otherUser.imageUrl,
                                      radius: 70,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(otherUser.username,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('"${otherUser.bio}"',
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                RaisedButton(
                                  color: _creatingConversation
                                      ? Colors.grey
                                      : Colors.blue,
                                  onPressed: !_creatingConversation
                                      ? () {
                                          setState(() {
                                            _creatingConversation = true;
                                          });
                                          _addConversation(context, otherUser);
                                        }
                                      : () {},
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
                        orElse: () => const SizedBox());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToChatScreen(BuildContext context, Map<String, dynamic> data) {
    ExtendedNavigator.of(context).pushNamed(Routes.chatScreen,
        arguments: ChatScreenArguments(
            user: widget.user,
            otherUser: data["otherUser"] as User,
            conversationSpecifics: ConversationSpecifics.fromJson(
                data["initialData"] as Map<String, dynamic>),
            conversationSpecificsStream:
                (data["stream"] as Stream<DocumentSnapshot>).map((snapshot) =>
                    ConversationSpecifics.fromJson(snapshot.data))));
  }

  void _addConversation(BuildContext context, User otherUser) {
    context
        .bloc<FindUserScreenBloc>()
        .add(FindUserScreenEvent.startConveration(widget.user, otherUser));
  }
}
