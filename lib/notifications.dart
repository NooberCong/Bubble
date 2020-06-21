import 'dart:convert';
import 'package:bubble/domain/i_cloud_data_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

  Future<void> initializeNotification(String uid) async {
    _configureCloudMessaging();
    _configureLocalNotification();
    await _updateUserDeviceToken(uid);
  }

  void _configureCloudMessaging() {
    firebaseMessaging.configure(onMessage: (message) {
      _showNotification(message["notification"] as Map<dynamic, dynamic>);
      return;
    }, onResume: (Map<String, dynamic> message) {
      return;
    }, onLaunch: (Map<String, dynamic> message) {
      return;
    });
  }

  Future _updateUserDeviceToken(String uid) async {
    cloudDataService.updateUserData(Params.map({
      "uid": uid,
      "data": {"token": await firebaseMessaging.getToken()}
    }));
  }

  void _configureLocalNotification() {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const initializationSettingsIOS = IOSInitializationSettings();
    const initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (data) {
      return Future.value(true);
    });
  }

  Future<void> _showNotification(Map<dynamic, dynamic> message) async {
    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'com.example.bubble',
      'main',
      'Bubble',
      playSound: true,
      enableVibration: true,
      importance: Importance.Max,
      priority: Priority.High,
    );
    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    final platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    return flutterLocalNotificationsPlugin.show(
      0,
      message['title'].toString(),
      message['body'].toString(),
      platformChannelSpecifics,
      payload: json.encode(message),
    );
  }
}
