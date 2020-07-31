import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @lazySingleton
  Firestore get firestore => Firestore.instance;

  @lazySingleton
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;

  @lazySingleton
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging();

  @lazySingleton
  FlutterLocalNotificationsPlugin get notifPlugin =>
      FlutterLocalNotificationsPlugin();

  @lazySingleton
  FirebaseDatabase get database => FirebaseDatabase.instance;

  @lazySingleton
  AssetsAudioPlayer get audioPlayer => AssetsAudioPlayer();

  @lazySingleton
  @preResolve
  Future<SharedPreferences> get preferences => SharedPreferences.getInstance();
}
