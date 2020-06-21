import 'package:bubble/bloc/find_user_screen_bloc/find_user_screen_bloc.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindUserActions extends StatefulWidget {
  const FindUserActions({Key key}) : super(key: key);

  @override
  _FindUserActionsState createState() => _FindUserActionsState();
}

class _FindUserActionsState extends State<FindUserActions> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                      labelText: "Find user by id",
                      border: InputBorder.none,
                      hintText: "UID",
                      hintMaxLines: 2,
                      fillColor: Colors.grey[200],
                      filled: true),
                ),
              ),
            ),
            const SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  context
                      .bloc<FindUserScreenBloc>()
                      .add(FindUserScreenEvent.findUserByUID(_controller.text));
                  _controller.clear();
                }
              },
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Flexible(
              child: Divider(
                color: Colors.grey,
              ),
            ),
            const Text("OR"),
            Flexible(
              child: Divider(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        RaisedButton(
          color: Colors.pink,
          onPressed: () => context.bloc<FindUserScreenBloc>().add(
              FindUserScreenEvent.random((context.bloc<SplashScreenBloc>().state
                      as SplashScreenStateAuthenticated)
                  .user
                  .uid)),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width,
            child: const Text("Chat with a stranger",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
  }
}
