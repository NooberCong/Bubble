import 'package:auto_route/auto_route.dart';
import 'package:bubble/backend/user_presence.dart';
import 'package:bubble/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/conversation.dart';
import 'package:bubble/notifications.dart';
import 'package:bubble/router.gr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIt<NotificationManager>()
        .initializeNotification(widget.user.uid, context);
    getIt<UserPresence>().initializePresence(widget.user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.color,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => _navigateToSettings(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FadeInImage.memoryNetwork(
                    width: 40,
                    height: 40,
                    placeholder: kTransparentImage,
                    image: widget.user.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text("\t\t\tChat"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () => ExtendedNavigator.of(context).pushNamed(
              Routes.findUserScreen,
              arguments: FindUserScreenArguments(user: widget.user)),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocProvider(
          create: (_) => getIt<HomeScreenBloc>()
            ..add(HomeScreenEvent.requestConversations(widget.user.uid)),
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                conversationsStreamLoaded: (stream) => SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 56,
                    child: StreamBuilder(
                      stream: stream,
                      builder: (context, snapshots) {
                        if (snapshots.hasData) {
                          final conversations =
                              (snapshots.data as QuerySnapshot).documents;
                          return conversations.isNotEmpty
                              ? ListView.builder(
                                  itemCount: conversations.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Conversation(
                                      data: conversations[index].data,
                                    );
                                  },
                                )
                              : Center(
                                  child: Text(
                                      "Click on the add button to start a conversation",
                                      style: TextStyle(color: Colors.grey)),
                                );
                        } else if (snapshots.hasError) {
                          return const Center(
                              child: Text("Loading conversations failed"));
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
                error: (e) => Center(
                  child: Text(e),
                ),
              );
            },
          ),
        ));
  }

  void _navigateToSettings(BuildContext context) {
    ExtendedNavigator.of(context).pushNamed(Routes.settingsScreen,
        arguments: SettingsScreenArguments(user: widget.user));
  }
}
