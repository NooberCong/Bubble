class ConversationSpecifics {
  final Map<String, dynamic> nicknames;
  final int themeColorCode;
  final String fontFamily;
  final String mainEmoji;

  const ConversationSpecifics({
    this.nicknames,
    this.fontFamily,
    this.themeColorCode,
    this.mainEmoji,
  });

  factory ConversationSpecifics.fromJson(Map<String, dynamic> json) {
    return ConversationSpecifics(
        nicknames: json["nicknames"] as Map<String, dynamic>,
        mainEmoji: json["mainEmoji"] as String,
        fontFamily: json["fontFamily"] as String,
        themeColorCode: json["themeColorCode"] as int);
  }
}
