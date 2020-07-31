import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/bloc/theme_bloc/theme_bloc.dart';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  _configureSystemSettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Widget app = BlocProvider(
    create: (_) => getIt<SplashScreenBloc>()
      ..add(const SplashScreenEvent.requestAuthCheck()),
    child: ExtendedNavigator<Router>(
      router: Router(),
    ),
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set status bar color to match with screen
    return BlocProvider(
      create: (_) =>
          getIt<ThemeBloc>()..add(const ThemeEvent.restoreSavedTheme()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return state.when(
            initial: () => _buildThemedApp(app, ThemeMode.system),
            loaded: (mode) => _buildThemedApp(app, mode),
          );
        },
      ),
    );
  }
}

void _configureSystemSettings() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

Widget _buildThemedApp(Widget app, ThemeMode mode) {
  return MaterialApp(
    title: 'Flutter Demo',
    themeMode: mode,
    theme: ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.blue,
      canvasColor: Colors.white,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        canvasColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.blue),
    home: app,
  );
}
