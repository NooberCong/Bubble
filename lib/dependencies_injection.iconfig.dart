// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:bubble/backend/modules.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bubble/backend/auth_service.dart';
import 'package:bubble/domain/i_auth.dart';
import 'package:bubble/backend/cloud_data_service.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:bubble/bloc/login_screen_bloc/login_screen_bloc.dart';
import 'package:bubble/notifications.dart';
import 'package:bubble/bloc/settings_screen_bloc/settings_screen_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bubble/bloc/sign_up_bloc/sign_up_state_manager.dart';
import 'package:bubble/core/validators/sign_up_validator.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/bloc/bloc/theme_bloc.dart';
import 'package:bubble/backend/user_presence.dart';
import 'package:bubble/bloc/user_status_ball_bloc/user_status_ball_bloc.dart';
import 'package:bubble/bloc/chat_screen_bloc/chat_screen_bloc.dart';
import 'package:bubble/bloc/find_user_screen_bloc/find_user_screen_bloc.dart';
import 'package:bubble/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'package:bubble/bloc/sign_up_bloc/sign_up_screen_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final registerModule = _$RegisterModule();
  g.registerLazySingleton<FirebaseAuth>(() => registerModule.firebaseAuth);
  g.registerLazySingleton<FirebaseDatabase>(() => registerModule.database);
  g.registerLazySingleton<FirebaseMessaging>(
      () => registerModule.firebaseMessaging);
  g.registerLazySingleton<FirebaseStorage>(
      () => registerModule.firebaseStorage);
  g.registerLazySingleton<Firestore>(() => registerModule.firestore);
  g.registerLazySingleton<FlutterLocalNotificationsPlugin>(
      () => registerModule.notifPlugin);
  g.registerLazySingleton<GoogleSignIn>(() => registerModule.googleSignIn);
  g.registerLazySingleton<IAuth>(() => AuthService(
        g<FirebaseAuth>(),
        g<GoogleSignIn>(),
        g<Firestore>(),
      ));
  g.registerLazySingleton<ICloudDataService>(
      () => CloudDataService(g<Firestore>(), g<FirebaseStorage>()));
  g.registerFactory<LoginScreenBloc>(
      () => LoginScreenBloc(authService: g<IAuth>()));
  g.registerLazySingleton<NotificationManager>(() => NotificationManager(
        g<FirebaseMessaging>(),
        g<FlutterLocalNotificationsPlugin>(),
        g<ICloudDataService>(),
      ));
  g.registerFactory<SettingsScreenBloc>(
      () => SettingsScreenBloc(g<IAuth>(), g<ICloudDataService>()));
  final sharedPreferences = await registerModule.preferences;
  g.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  g.registerFactory<SignUpStateManager>(() => SignUpStateManager());
  g.registerLazySingleton<SignUpValidator>(() => SignUpValidator());
  g.registerFactory<SplashScreenBloc>(
      () => SplashScreenBloc(g<IAuth>(), g<ICloudDataService>()));
  g.registerFactory<ThemeBloc>(() => ThemeBloc(g<SharedPreferences>()));
  g.registerLazySingleton<UserPresence>(
      () => UserPresence(g<FirebaseDatabase>()));
  g.registerFactory<UserStatusBallBloc>(
      () => UserStatusBallBloc(g<ICloudDataService>()));
  g.registerFactoryParam<ChatScreenBloc, String, dynamic>(
      (chatRoomId, _) => ChatScreenBloc(
            g<ICloudDataService>(),
            g<SharedPreferences>(),
            chatRoomId,
          ));
  g.registerFactory<FindUserScreenBloc>(
      () => FindUserScreenBloc(g<ICloudDataService>()));
  g.registerFactory<HomeScreenBloc>(
      () => HomeScreenBloc(g<ICloudDataService>()));
  g.registerFactory<SignUpScreenBloc>(() => SignUpScreenBloc(
        g<IAuth>(),
        g<ICloudDataService>(),
        stateManager: g<SignUpStateManager>(),
        validator: g<SignUpValidator>(),
      ));
}

class _$RegisterModule extends RegisterModule {}
