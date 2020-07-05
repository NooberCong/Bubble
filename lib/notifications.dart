import 'dart:async';
import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'core/params/params.dart';

@lazySingleton
class NotificationManager {
  final FirebaseMessaging firebaseMessaging;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final ICloudDataService cloudDataService;

  NotificationManager(this.firebaseMessaging,
      this.flutterLocalNotificationsPlugin, this.cloudDataService);

  Future<void> initializeNotification(String uid, BuildContext context) async {
    _configureLocalNotification(context);
    _configureCloudMessaging(context);
    return _updateUserToken(uid);
  }

  void _configureCloudMessaging(BuildContext context) {
    firebaseMessaging.configure(onMessage: (message) async {
      _showNotification(message);
      return;
    }, onResume: (Map<String, dynamic> message) async {
      return _navigateToChatScreen(
          message["data"] as Map<dynamic, dynamic>, context);
    }, onLaunch: (Map<String, dynamic> message) async {
      return;
    });
  }

  Future<void> _updateUserToken(String uid) async {
    final deviceToken = await firebaseMessaging.getToken();
    return cloudDataService.updateUserData(Params.map({
      "uid": uid,
      "data": {"token": deviceToken}
    }));
  }

  void _configureLocalNotification(BuildContext context) {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const initializationSettingsIOS = IOSInitializationSettings();
    const initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) {
      return _navigateToChatScreen(
          json.decode(payload) as Map<dynamic, dynamic>, context);
    });
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        .createNotificationChannel(const AndroidNotificationChannel(
            "com.example.bubble", "Bubble", "A messaging app"));
  }

  Future<void> _showNotification(Map<dynamic, dynamic> message) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'com.example.bubble', 'main', 'Bubble',
        importance: Importance.Max,
        priority: Priority.High,
        groupKey: "message");
    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    return flutterLocalNotificationsPlugin.show(
      0,
      message["notification"]['title'].toString(),
      message["notification"]['body'].toString(),
      platformChannelSpecifics,
      payload: json.encode(message["data"]),
    );
  }

  Future<void> _navigateToChatScreen(
      Map<dynamic, dynamic> messageData, BuildContext context) {
    ExtendedNavigator.of(context).popUntil((route) => route.isFirst);
    return ExtendedNavigator.of(context).pushNamed(Routes.chatScreen,
        arguments: ChatScreenArguments(
            user: (context.bloc<SplashScreenBloc>().state
                    as SplashScreenStateAuthenticated)
                .user,
            otherUser: User.fromJson(
                json.decode(messageData["otherUser"] as String)
                    as Map<String, dynamic>)));
  }
}
