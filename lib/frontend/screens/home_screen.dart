import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/widgets/conversation.dart';
import 'package:bubble/router.gr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F9FA),
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 0,
          backgroundColor: const Color(0xffF5F9FA),
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: user.imageUrl,
                  ),
                ),
              ),
              const Text("\t\t\tChat", style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () => ExtendedNavigator.of(context).pushNamed(
              Routes.findUserScreen,
              arguments: FindUserScreenArguments(user: user)),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocProvider(
          create: (_) => getIt<HomeScreenBloc>()
            ..add(HomeScreenEvent.requestConversations(user.uid)),
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
}
