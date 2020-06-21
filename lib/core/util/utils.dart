import 'dart:math';
import 'package:intl/intl.dart';

String getRoomIdFromUIDHashCode(String idFrom, String idTo) {
  final hashedUIDs = [idFrom, idTo].map((e) => e.hashCode.toString()).toList();
  hashedUIDs.sort();
  return hashedUIDs.join("-");
}

String generateRandomNumString() {
  return (Random(DateTime.now().millisecondsSinceEpoch).nextDouble() *
          1000000000)
      .toInt()
      .toString();
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
