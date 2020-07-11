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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
          ),
          const Text(
            "Join Bubble\n",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const Text(
              "We will help you create your account in just a few easy steps\n",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16)),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: RaisedButton(
              color: Colors.pink,
              onPressed: () => nextScreen(context, ""),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                child: const Text(
                  "Get started",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
