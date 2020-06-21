import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

extension UserConversion on FirebaseUser {
  User toUser() {
    return User(uid: uid, username: displayName, imageUrl: photoUrl, bio: "");
  }

  Map<String, dynamic> toDetails() {
    return {
      "name": displayName,
      "bio": "",
      "chattingWith": "",
      "email": email,
      "imageUrl": photoUrl,
      "isOnline": true
    };
  }
}

class User {
  final String uid;
  final String username;
  final String imageUrl;
  final String bio;

  User(
      {@required this.uid,
      @required this.username,
      @required this.imageUrl,
      @required this.bio})
      : assert(uid is String && uid.isNotEmpty),
        assert(username is String && username.isNotEmpty);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        imageUrl: json["imageUrl"] as String,
        uid: json["uid"] as String,
        bio: json["bio"] as String,
        username: json["name"] as String);
  }

  Map<String, dynamic> toJson() {
    return {"imageUrl": imageUrl, "uid": uid, "bio": bio, "name": username};
  }
}
