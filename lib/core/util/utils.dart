import 'dart:math';
import 'package:bubble/dependencies_injection.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:bubble/frontend/providers/conversation_specifics_provider.dart';
import 'package:bubble/notifications.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

String getRoomIdFromUIDHashCode(String idFrom, String idTo) {
  final hashedUIDs = [idFrom, idTo].map((e) => e.hashCode.toString()).toList();
  hashedUIDs.sort();
  return hashedUIDs.join("-");
}

void clearNotifications(String roomId) {
  getIt<NotificationManager>().clearNotifications(roomId);
}

String generateRandomNumString() {
  return (Random(DateTime.now().millisecondsSinceEpoch).nextDouble() *
          1000000000)
      .toInt()
      .toString();
}

bool isUrl(String text) {
  final urlRegex = RegExp(
      r"^(https?:\/\/(www\.)?)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)");
  return urlRegex.hasMatch(text);
}

String parseUrl(String text) {
  return text.startsWith("http") ? text : "http://$text";
}

String messageTimestampFormat(String milisecsSinceEpoch) {
  return DateFormat('dd MMM kk:mm').format(
      DateTime.fromMillisecondsSinceEpoch(int.parse(milisecsSinceEpoch)));
}

String parseLastActive(String milisecsSinceEpoch) {
  final difference = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(int.parse(milisecsSinceEpoch)));
  return "Active ${_parseTimeDifference(difference)} ago";
}

String _parseTimeDifference(Duration difference) {
  return difference.inDays > 0
      ? "${difference.inDays} day${difference.inDays != 1 ? 's' : ''}"
      : difference.inHours > 0
          ? "${difference.inHours} hour${difference.inHours != 1 ? 's' : ''}"
          : difference.inMinutes > 0
              ? "${difference.inMinutes} minute${difference.inMinutes != 1 ? 's' : ''}"
              : "${difference.inSeconds} second${difference.inSeconds != 1 ? 's' : ''}";
}

Future<PickedFile> getGaleryImage() async {
  final imgPicker = ImagePicker();
  return imgPicker.getImage(source: ImageSource.gallery);
}

User chatRoomUser(BuildContext context) {
  return ConversationSpecificsProvider.of(context).user;
}

User chatRoomOtherUser(BuildContext context) {
  return ConversationSpecificsProvider.of(context).otherUser;
}

Color grey(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? Colors.grey.shade700
      : Colors.grey.shade300;
}

String roomID(BuildContext context) {
  return ConversationSpecificsProvider.of(context).roomId;
}

bool isNotEmpty(String text) {
  return text.trim().isNotEmpty;
}

String parseSvg(String src) {
  return src.split("\$SIZE\$").first;
}
