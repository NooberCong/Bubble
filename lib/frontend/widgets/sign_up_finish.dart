import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpFinish extends StatelessWidget {
  final User user;
  const SignUpFinish({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            "assets/images/congrats.svg",
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.width / 1.5,
          ),
          Text(
            "\nCongratulations ${user.username}, your account is ready\n",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          RaisedButton(
            color: Colors.pink,
            onPressed: () => _navigateToHomePage(context, user),
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Start Bubbling",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToHomePage(BuildContext context, User user) {
    ExtendedNavigator.of(context).pop();
    context.bloc<SplashScreenBloc>().add(SplashScreenEvent.authenticate(user));
  }
}
