import 'package:bubble/core/util/utils.dart';

class UserStatus {
  final bool isOnline;
  final String lastActive;

  UserStatus({this.isOnline, this.lastActive});

  factory UserStatus.fromJson(Map<String, dynamic> json) {
    return UserStatus(
        isOnline: json["state"] == "online",
        lastActive: parseLastActive(json["onlineStatusLastChanged"] as String));
  }
}
