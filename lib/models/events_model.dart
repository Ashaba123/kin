class EventModel {
  EventModel({this.imgUrl});

  String? imgUrl;
  

  EventModel.fromJson(Map<String, Object?> json)
      : this(imgUrl: json["imgUrl"]! as String);

  Map<String, Object?> toJson() => {
        "imgUrl": imgUrl,
      };
}
