class SermonModel {
  String? sermonName;
  String? pastorName;
  String? audioUrl;

  SermonModel(
      {required this.sermonName,
      required this.pastorName,
      required this.audioUrl});

  SermonModel.fromJson(Map<String, Object?> json)
      : this(
            sermonName: json['sermonName']! as String,
            audioUrl: json['audioUrl']! as String,
            pastorName: json['pastorName']! as String);

  Map<String, Object?> toJson() {
    return {
      'sermonName': sermonName,
      'audioUrl': audioUrl,
      'pastorName': pastorName
    };
  }
}
