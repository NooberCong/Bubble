import 'package:auto_route/auto_route_annotations.dart';
import 'package:bubble/frontend/screens/chat_screen.dart';
import 'package:bubble/frontend/screens/find_user_screen.dart';
import 'package:bubble/frontend/screens/full_photo.dart';
import 'package:bubble/frontend/screens/home_screen.dart';
import 'package:bubble/frontend/screens/login_screen.dart';
import 'package:bubble/frontend/screens/sign_up_screen.dart';
import 'package:bubble/frontend/screens/splash_screen.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  @initial
  SplashScreen splashScreen;
  LoginScreen loginScreen;
  SignUpScreen signUpScreen;
  HomeScreen homeScreen;
  ChatScreen chatScreen;
  FindUserScreen findUserScreen;
  FullPhoto fullPhoto;
}