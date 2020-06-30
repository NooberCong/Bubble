// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bubble/frontend/screens/splash_screen.dart';
import 'package:bubble/frontend/screens/login_screen.dart';
import 'package:bubble/frontend/screens/sign_up_screen.dart';
import 'package:bubble/frontend/screens/settings_screen.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/screens/home_screen.dart';
import 'package:bubble/frontend/screens/other_user_info_screen.dart';
import 'package:bubble/frontend/screens/chat_screen.dart';
import 'package:bubble/frontend/screens/find_user_screen.dart';
import 'package:bubble/frontend/screens/full_photo.dart';
import 'package:bubble/frontend/widgets/take_picture_screen.dart';

abstract class Routes {
  static const splashScreen = '/';
  static const loginScreen = '/login-screen';
  static const signUpScreen = '/sign-up-screen';
  static const settingsScreen = '/settings-screen';
  static const homeScreen = '/home-screen';
  static const otherUserInfoScreen = '/other-user-info-screen';
  static const chatScreen = '/chat-screen';
  static const findUserScreen = '/find-user-screen';
  static const fullPhoto = '/full-photo';
  static const displayPictureScreen = '/display-picture-screen';
  static const takePictureScreen = '/take-picture-screen';
  static const all = {
    splashScreen,
    loginScreen,
    signUpScreen,
    settingsScreen,
    homeScreen,
    otherUserInfoScreen,
    chatScreen,
    findUserScreen,
    fullPhoto,
    displayPictureScreen,
    takePictureScreen,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        if (hasInvalidArgs<SplashScreenArguments>(args)) {
          return misTypedArgsRoute<SplashScreenArguments>(args);
        }
        final typedArgs =
            args as SplashScreenArguments ?? SplashScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SplashScreen(key: typedArgs.key),
          settings: settings,
        );
      case Routes.loginScreen:
        if (hasInvalidArgs<LoginScreenArguments>(args)) {
          return misTypedArgsRoute<LoginScreenArguments>(args);
        }
        final typedArgs =
            args as LoginScreenArguments ?? LoginScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginScreen(key: typedArgs.key),
          settings: settings,
        );
      case Routes.signUpScreen:
        if (hasInvalidArgs<SignUpScreenArguments>(args)) {
          return misTypedArgsRoute<SignUpScreenArguments>(args);
        }
        final typedArgs =
            args as SignUpScreenArguments ?? SignUpScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignUpScreen(key: typedArgs.key),
          settings: settings,
        );
      case Routes.settingsScreen:
        if (hasInvalidArgs<SettingsScreenArguments>(args)) {
          return misTypedArgsRoute<SettingsScreenArguments>(args);
        }
        final typedArgs =
            args as SettingsScreenArguments ?? SettingsScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              SettingsScreen(key: typedArgs.key, user: typedArgs.user),
          settings: settings,
        );
      case Routes.homeScreen:
        if (hasInvalidArgs<HomeScreenArguments>(args)) {
          return misTypedArgsRoute<HomeScreenArguments>(args);
        }
        final typedArgs = args as HomeScreenArguments ?? HomeScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              HomeScreen(key: typedArgs.key, user: typedArgs.user),
          settings: settings,
        );
      case Routes.otherUserInfoScreen:
        if (hasInvalidArgs<OtherUserInfoScreenArguments>(args)) {
          return misTypedArgsRoute<OtherUserInfoScreenArguments>(args);
        }
        final typedArgs = args as OtherUserInfoScreenArguments ??
            OtherUserInfoScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              OtherUserInfoScreen(key: typedArgs.key, user: typedArgs.user),
          settings: settings,
        );
      case Routes.chatScreen:
        if (hasInvalidArgs<ChatScreenArguments>(args)) {
          return misTypedArgsRoute<ChatScreenArguments>(args);
        }
        final typedArgs = args as ChatScreenArguments ?? ChatScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => ChatScreen(
              key: typedArgs.key,
              user: typedArgs.user,
              otherUser: typedArgs.otherUser),
          settings: settings,
        );
      case Routes.findUserScreen:
        if (hasInvalidArgs<FindUserScreenArguments>(args)) {
          return misTypedArgsRoute<FindUserScreenArguments>(args);
        }
        final typedArgs =
            args as FindUserScreenArguments ?? FindUserScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              FindUserScreen(key: typedArgs.key, user: typedArgs.user),
          settings: settings,
        );
      case Routes.fullPhoto:
        if (hasInvalidArgs<FullPhotoArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<FullPhotoArguments>(args);
        }
        final typedArgs = args as FullPhotoArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => FullPhoto(
              key: typedArgs.key, url: typedArgs.url, title: typedArgs.title),
          settings: settings,
        );
      case Routes.displayPictureScreen:
        if (hasInvalidArgs<DisplayPictureScreenArguments>(args)) {
          return misTypedArgsRoute<DisplayPictureScreenArguments>(args);
        }
        final typedArgs = args as DisplayPictureScreenArguments ??
            DisplayPictureScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => DisplayPictureScreen(
              key: typedArgs.key,
              imagePath: typedArgs.imagePath,
              onSave: typedArgs.onSave),
          settings: settings,
        );
      case Routes.takePictureScreen:
        if (hasInvalidArgs<TakePictureScreenArguments>(args)) {
          return misTypedArgsRoute<TakePictureScreenArguments>(args);
        }
        final typedArgs =
            args as TakePictureScreenArguments ?? TakePictureScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              TakePictureScreen(key: typedArgs.key, onSave: typedArgs.onSave),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//SplashScreen arguments holder class
class SplashScreenArguments {
  final Key key;
  SplashScreenArguments({this.key});
}

//LoginScreen arguments holder class
class LoginScreenArguments {
  final Key key;
  LoginScreenArguments({this.key});
}

//SignUpScreen arguments holder class
class SignUpScreenArguments {
  final Key key;
  SignUpScreenArguments({this.key});
}

//SettingsScreen arguments holder class
class SettingsScreenArguments {
  final Key key;
  final User user;
  SettingsScreenArguments({this.key, this.user});
}

//HomeScreen arguments holder class
class HomeScreenArguments {
  final Key key;
  final User user;
  HomeScreenArguments({this.key, this.user});
}

//OtherUserInfoScreen arguments holder class
class OtherUserInfoScreenArguments {
  final Key key;
  final User user;
  OtherUserInfoScreenArguments({this.key, this.user});
}

//ChatScreen arguments holder class
class ChatScreenArguments {
  final Key key;
  final User user;
  final User otherUser;
  ChatScreenArguments({this.key, this.user, this.otherUser});
}

//FindUserScreen arguments holder class
class FindUserScreenArguments {
  final Key key;
  final User user;
  FindUserScreenArguments({this.key, this.user});
}

//FullPhoto arguments holder class
class FullPhotoArguments {
  final Key key;
  final String url;
  final String title;
  FullPhotoArguments({this.key, @required this.url, this.title});
}

//DisplayPictureScreen arguments holder class
class DisplayPictureScreenArguments {
  final Key key;
  final String imagePath;
  final void Function(String) onSave;
  DisplayPictureScreenArguments({this.key, this.imagePath, this.onSave});
}

//TakePictureScreen arguments holder class
class TakePictureScreenArguments {
  final Key key;
  final void Function(String) onSave;
  TakePictureScreenArguments({this.key, this.onSave});
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushSplashScreen({
    Key key,
  }) =>
      pushNamed(
        Routes.splashScreen,
        arguments: SplashScreenArguments(key: key),
      );

  Future pushLoginScreen({
    Key key,
  }) =>
      pushNamed(
        Routes.loginScreen,
        arguments: LoginScreenArguments(key: key),
      );

  Future pushSignUpScreen({
    Key key,
  }) =>
      pushNamed(
        Routes.signUpScreen,
        arguments: SignUpScreenArguments(key: key),
      );

  Future pushSettingsScreen({
    Key key,
    User user,
  }) =>
      pushNamed(
        Routes.settingsScreen,
        arguments: SettingsScreenArguments(key: key, user: user),
      );

  Future pushHomeScreen({
    Key key,
    User user,
  }) =>
      pushNamed(
        Routes.homeScreen,
        arguments: HomeScreenArguments(key: key, user: user),
      );

  Future pushOtherUserInfoScreen({
    Key key,
    User user,
  }) =>
      pushNamed(
        Routes.otherUserInfoScreen,
        arguments: OtherUserInfoScreenArguments(key: key, user: user),
      );

  Future pushChatScreen({
    Key key,
    User user,
    User otherUser,
  }) =>
      pushNamed(
        Routes.chatScreen,
        arguments:
            ChatScreenArguments(key: key, user: user, otherUser: otherUser),
      );

  Future pushFindUserScreen({
    Key key,
    User user,
  }) =>
      pushNamed(
        Routes.findUserScreen,
        arguments: FindUserScreenArguments(key: key, user: user),
      );

  Future pushFullPhoto({
    Key key,
    @required String url,
    String title,
  }) =>
      pushNamed(
        Routes.fullPhoto,
        arguments: FullPhotoArguments(key: key, url: url, title: title),
      );

  Future pushDisplayPictureScreen({
    Key key,
    String imagePath,
    void Function(String) onSave,
  }) =>
      pushNamed(
        Routes.displayPictureScreen,
        arguments: DisplayPictureScreenArguments(
            key: key, imagePath: imagePath, onSave: onSave),
      );

  Future pushTakePictureScreen({
    Key key,
    void Function(String) onSave,
  }) =>
      pushNamed(
        Routes.takePictureScreen,
        arguments: TakePictureScreenArguments(key: key, onSave: onSave),
      );
}
