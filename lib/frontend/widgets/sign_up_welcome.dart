import 'package:bubble/frontend/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpWelcome extends StatelessWidget {
  const SignUpWelcome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            "assets/images/welcome.svg",
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.width / 1.5,
          ),
          const Text(
            "Join Bubble\n",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            "We will help you create your account in just a few easy steps\n",
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            color: Colors.pink,
            onPressed: () => nextScreen(context, ""),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: const Text(
                "Get started",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
