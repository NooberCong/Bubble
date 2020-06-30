import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/frontend/screens/home_screen.dart';
import 'package:bubble/frontend/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: BlocBuilder<SplashScreenBloc, SplashScreenState>(
        builder: (context, state) {
          return state.when(
              initial: () => Container(
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
              authenticated: (user) => HomeScreen(
                    user: user,
                  ),
              unauthenticated: () => const LoginScreen());
        },
      ),
    );
  }
}
