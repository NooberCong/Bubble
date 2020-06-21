import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set status bar color to match with screen
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => getIt<SplashScreenBloc>()
          ..add(const SplashScreenEvent.requestAuthCheck()),
        child: ExtendedNavigator<Router>(
          router: Router(),
        ),
      ),
    );
  }
}
