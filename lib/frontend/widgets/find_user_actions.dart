import 'package:bubble/bloc/find_user_screen_bloc/find_user_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bubble/domain/entities/user.dart';

class FindUserActions extends StatefulWidget {
  final User user;
  const FindUserActions({Key key, this.user}) : super(key: key);

  @override
  _FindUserActionsState createState() => _FindUserActionsState();
}

class _FindUserActionsState extends State<FindUserActions> {
  final _controller = TextEditingController();
  final _node = FocusNode();

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
                  focusNode: _node,
                  controller: _controller,
                  decoration: InputDecoration(
                      labelText: "Find user by id",
                      border: InputBorder.none,
                      hintText: "UID",
                      hintMaxLines: 2,
                      fillColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey.shade800
                          : Colors.grey.shade200,
                      filled: true),
                ),
              ),
            ),
            const SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  _node.unfocus();
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
          children: const <Widget>[
            Flexible(
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Text(
              "OR",
            ),
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
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: RaisedButton(
            color: Colors.pink,
            onPressed: () => context
                .bloc<FindUserScreenBloc>()
                .add(FindUserScreenEvent.random(widget.user.uid)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width,
              child: const Text("Chat with a stranger",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700)),
            ),
          ),
        )
      ],
    );
  }
}
