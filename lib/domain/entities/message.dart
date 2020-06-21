enum MessageType { text, image, sticker }

class Message {
  final String content;
  final MessageType type;
  final String idFrom;
  final String timestamp;
  final String idTo;

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "type": type.toString(),
      "idFrom": idFrom,
      "timestamp": timestamp,
      "idTo": idTo
    };
  }

  Message({this.content, this.type, this.idFrom, this.idTo})
      : timestamp = DateTime.now().millisecondsSinceEpoch.toString();
}
