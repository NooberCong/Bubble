enum MessageType { text, image, sticker, svg, url, gif }

class Message {
  final String content;
  final MessageType type;
  final String idFrom;
  final String timestamp;
  final String idTo;
  final bool seen;
  final Map<String, dynamic> reactions;
  final Map<String, dynamic> referenceTo;
  final List<dynamic> referencedBy;
  String messageId;

  static const Map<String, dynamic> defaultReactionsValue = {
    "❤️": [],
    "😆": [],
    "😮": [],
    "😢": [],
    "😠": [],
    "👍": [],
    "👎": [],
  };

  static const referceToDefaultValue = <String, dynamic>{};

  static const refercedByDefaultValue = <dynamic>[];

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "type": type.toString(),
      "idFrom": idFrom,
      "timestamp": timestamp,
      "idTo": idTo,
      "seen": seen,
      "messageId": messageId,
      "reactions": reactions,
      "referenceTo": referenceTo,
      "referencedBy": referencedBy
    };
  }

  Message(
      {this.referenceTo = referceToDefaultValue,
      this.referencedBy = refercedByDefaultValue,
      this.reactions = defaultReactionsValue,
      this.content,
      this.type,
      this.idFrom,
      this.idTo,
      this.timestamp,
      this.seen,
      this.messageId});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        reactions: json["reactions"] != null
            ? json["reactions"] as Map<String, dynamic>
            : defaultReactionsValue,
        content: json["content"] as String,
        idFrom: json["idFrom"] as String,
        idTo: json["idTo"] as String,
        seen: json["seen"] as bool,
        referenceTo: json["referenceTo"] as Map<String, dynamic>,
        referencedBy: json["referencedBy"] as List<dynamic>,
        timestamp: json["timestamp"] as String,
        type: parseType(json["type"] as String));
  }

  static MessageType parseType(String stringedType) {
    return stringedType == "MessageType.text"
        ? MessageType.text
        : stringedType == "MessageType.image"
            ? MessageType.image
            : stringedType == "MessageType.sticker"
                ? MessageType.sticker
                : stringedType == "MessageType.url"
                    ? MessageType.url
                    : stringedType == "MessageType.gif"
                        ? MessageType.gif
                        : MessageType.svg;
  }
}
