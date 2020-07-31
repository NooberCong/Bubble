import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserPresence {
  final FirebaseDatabase database;
  UserPresence(this.database);

  Future<void> initializePresence(String uid) async {
    final userStatusDatabaseRef = database.reference().child("/status/$uid");

    final offlineData = {
      "state": "offline",
      "onlineStatusLastChanged": Timestamp.now().millisecondsSinceEpoch,
    };

    final onlineData = {
      "state": "online",
      "onlineStatusLastChanged": Timestamp.now().millisecondsSinceEpoch,
    };

    database.reference().child(".info/connected").onValue.listen((event) async {
      if (event.snapshot.value == true) {
        userStatusDatabaseRef
            .onDisconnect()
            .set(offlineData)
            .then((_) => userStatusDatabaseRef.set(onlineData));
      }
    });
  }
}
