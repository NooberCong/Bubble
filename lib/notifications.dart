import 'dart:async';
import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:bubble/backend/cloud_data_service.dart';
import 'package:bubble/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:bubble/domain/entities/conversation_specifics.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:bubble/router.gr.dart';
import 'package:flutter/material.dart';
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
    await _configureLocalNotification(context);
    await _configureCloudMessaging(context);
    return _updateUserToken(uid);
  }

  Future<dynamic> _configureCloudMessaging(BuildContext context) async {
    return firebaseMessaging.configure(
      onMessage: (message) {
        _showNotification(message);
        return;
      },
      onResume: (Map<String, dynamic> message) async {
        flutterLocalNotificationsPlugin
            .cancel((message["data"]["roomId"] as String).hashCode % 1000);
        return _navigateToChatScreen(
            message["data"] as Map<dynamic, dynamic>, context);
      },
      onLaunch: (Map<String, dynamic> message) async {
        flutterLocalNotificationsPlugin
            .cancel((message["data"]["roomId"] as String).hashCode % 1000);
        return;
      },
    );
  }

  Future<void> _updateUserToken(String uid) async {
    final deviceToken = await firebaseMessaging.getToken();
    cloudDataService.updateUserData(Params.map({
      "uid": uid,
      "data": {"token": deviceToken}
    }));
  }

  Future<bool> _configureLocalNotification(BuildContext context) async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const initializationSettingsIOS = IOSInitializationSettings();
    const initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    return flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) {
      return _navigateToChatScreen(
          json.decode(payload) as Map<dynamic, dynamic>, context);
    });
  }

  Future<void> _showNotification(Map<String, dynamic> message) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'com.example.bubble', 'messageChannel', 'Bubble',
        sound: const RawResourceAndroidNotificationSound("notification"),
        groupKey: message["data"]["roomId"] as String,
        importance: Importance.High,
        priority: Priority.High);
    final platformChannelSpecifics =
        NotificationDetails(androidPlatformChannelSpecifics, null);
    return flutterLocalNotificationsPlugin.show(
      (message["data"]["roomId"] as String).hashCode % 1000,
      message["notification"]["title"].toString(),
      message["notification"]["body"].toString(),
      platformChannelSpecifics,
      payload: json.encode(message["data"]),
    );
  }

  Future<void> _navigateToChatScreen(
      Map<dynamic, dynamic> messageData, BuildContext context) async {
    final user = (context.bloc<SplashScreenBloc>().state
            as SplashScreenStateAuthenticated)
        .user;
    final otherUser = User.fromJson(json
        .decode(messageData["otherUser"] as String) as Map<String, dynamic>);
    final docSnapshotOrFailure = await (cloudDataService as CloudDataService)
        .fetchConversationData(Params.map(
            {"userId": user.uid, "roomId": messageData["roomId"] as String}));
    ExtendedNavigator.of(context).popUntil((route) => route.isFirst);
    docSnapshotOrFailure.fold(
        (error) => {},
        (snapshot) => {
              ExtendedNavigator.of(context).pushNamed(
                Routes.chatScreen,
                arguments: ChatScreenArguments(
                    user: (context.bloc<SplashScreenBloc>().state
                            as SplashScreenStateAuthenticated)
                        .user,
                    otherUser: otherUser,
                    conversationSpecifics:
                        ConversationSpecifics.fromJson(snapshot.data),
                    conversationSpecificsStream: snapshot.reference
                        .snapshots()
                        .map((snapshot) =>
                            ConversationSpecifics.fromJson(snapshot.data))),
              )
            });
    return;
  }

  void clearNotifications(String roomId) {
    flutterLocalNotificationsPlugin.cancel(_roomIdToNotificationId(roomId));
  }

  int _roomIdToNotificationId(String roomId) {
    return roomId.hashCode % 1000;
  }
}
