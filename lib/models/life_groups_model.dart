class LifeGroupsModel {
  String? groupName;
  String? location;
  String? phone;
  LifeGroupsModel({this.groupName, this.location, this.phone});

  LifeGroupsModel.fromJson(Map<String, Object?> json)
      : this(
            groupName: json['groupName']! as String,
            location: json['location']! as String,
            phone: json['phone']! as String);

  Map<String, Object?> toJson() {
    return {'groupName': groupName, 'location': location, 'phone': phone};
  }
}
