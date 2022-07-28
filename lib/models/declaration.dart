class Declaration {
  Declaration({
    this.title,
  });
  Declaration.fromJson(Map<String, Object?> json)
      : this(title: json['title']! as String);

  String? title;

  Map<String, Object?> toJson() {
    return {
      'title': title,
    };
  }
}
