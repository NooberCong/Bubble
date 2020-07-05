enum MessageType { text, image, sticker, svg }

class Message {
  final String content;
  final MessageType type;
  final String idFrom;
  final String timestamp;
  final String idTo;
  final bool seen;
  final String messageId;

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "type": type.toString(),
      "idFrom": idFrom,
      "timestamp": timestamp,
      "idTo": idTo,
      "seen": seen,
      "messageId": messageId
    };
  }

  Message(
      {this.content,
      this.type,
      this.idFrom,
      this.idTo,
      this.timestamp,
      this.seen,
      this.messageId});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        content: json["content"] as String,
        idFrom: json["idFrom"] as String,
        idTo: json["idTo"] as String,
        seen: json["seen"] as bool,
        timestamp: json["timestamp"] as String,
        messageId: json["messageId"] as String,
        type: _parseMessageType(json["type"] as String));
  }

  static MessageType _parseMessageType(String stringedType) {
    return stringedType == "MessageType.text"
        ? MessageType.text
        : stringedType == "MessageType.image"
            ? MessageType.image
            : stringedType == "MessageType.sticker"
                ? MessageType.sticker
                : MessageType.svg;
  }
}
