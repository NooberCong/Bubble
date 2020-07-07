class ConversationSpecifics {
  final String userNickname;
  final String otherUserNickname;
  final int themeColorCode;
  final String fontFamily;
  final String mainEmoji;

  const ConversationSpecifics(
      {this.fontFamily,
      this.userNickname,
      this.otherUserNickname,
      this.themeColorCode,
      this.mainEmoji});

  factory ConversationSpecifics.fromJson(Map<String, dynamic> json) {
    return ConversationSpecifics(
        userNickname: json["userNickname"] as String,
        otherUserNickname: json["otherUserNickname"] as String,
        mainEmoji: json["mainEmoji"] as String,
        fontFamily: json["fontFamily"] as String,
        themeColorCode: json["themeColorCode"] as int);
  }
}
