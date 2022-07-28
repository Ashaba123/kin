class Devotion {
  Devotion({
    this.scripture,
    this.text,
  });
  Devotion.fromJson(Map<String, Object?> json)
      : this(
            scripture: json['scripture']! as String,
            text: json['text']! as String);

  String? scripture;
  String? text;

  Map<String, Object?> toJson() {
    return {
      'scripture': scripture,
      'text': text,
    };
  }
}

