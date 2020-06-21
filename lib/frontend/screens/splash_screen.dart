import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashScreenBloc, SplashScreenState>(
      listener: (_, state) {
        state.when(
          initial: () {},
          authenticated: (user) => ExtendedNavigator.of(context)
              .pushReplacementNamed(Routes.homeScreen,
                  arguments: HomeScreenArguments(user: user)),
          unauthenticated: () => ExtendedNavigator.of(context)
              .pushReplacementNamed(Routes.loginScreen),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.pink,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.pink,
          child: Center(
            child: Text("Bubble",
                style: GoogleFonts.paprika(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
