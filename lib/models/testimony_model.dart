class TestimonyModel {
  String? name;
  String? testimony;
  TestimonyModel({this.name, this.testimony});

  TestimonyModel.fromJson(Map<String, Object?> json)
      : this(
            name: json['name']! as String,
            testimony: json['testimony']! as String);

  Map<String, Object?> toJson() {
    return {
      'scripture': name,
      'text': testimony,
    };
  }
}
