import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserPresence {
  final FirebaseDatabase database;
  UserPresence(this.database);

  Future<void> initializePresence(String uid) async {
    final userStatusDatabaseRef = database.reference().child("/status/$uid");

    final isOfflineForDatabase = {
      "state": "offline",
      "lastActive": DateTime.now().millisecondsSinceEpoch.toString(),
      "chattingWith": ""
    };

    final isOnlineForDatabase = {
      "state": "online",
      "lastActive": DateTime.now().millisecondsSinceEpoch.toString(),
    };

    database.reference().child(".info/connected").onValue.listen((event) async {
      if (event.snapshot.value == true) {
        userStatusDatabaseRef
            .onDisconnect()
            .set(isOfflineForDatabase)
            .then((_) => userStatusDatabaseRef.set(isOnlineForDatabase));
      }
    });
  }
}
