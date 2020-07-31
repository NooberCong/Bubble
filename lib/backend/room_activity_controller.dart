import 'package:bubble/domain/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class RoomActivityController {
  final Firestore store;
  final User user;
  RoomActivityController(
    this.store,
    @factoryParam this.user,
  );

  Future<void> joinRoom(String roomId) async {
    final userDoc = await _userDoc();
    final joinedRooms = userDoc.data["joinedRooms"] as List<dynamic>;
    if (!joinedRooms.contains(roomId)) {
      joinedRooms.add(roomId);
      userDoc.reference.updateData({"joinedRooms": joinedRooms});
    }
  }

  Future<void> leaveRoom(String roomId) async {
    final userDoc = await _userDoc();
    final joinedRooms = userDoc.data["joinedRooms"] as List<dynamic>;
    if (joinedRooms.contains(roomId)) {
      joinedRooms.remove(roomId);
      userDoc.reference.updateData({"joinedRooms": joinedRooms});
    }
  }

  Future<DocumentSnapshot> _userDoc() =>
      store.collection("users").document(user.uid).get();
}
