class PastorsModel {
  String? pastorName;
  String? imgUrl;
  PastorsModel({required this.pastorName, required this.imgUrl});

  PastorsModel.fromJson(Map<String, Object?> json)
      : this(
          pastorName: json['pastorName']! as String,
          imgUrl: json['imgUrl']! as String,
        );
  Map<String, Object?> toJson() {
    return {'pastorName': pastorName, 'imgUrl': imgUrl};
  }
}

// List<Pastors> pastors = [
//   Pastors(name: "Ps. Arthur Malinga", image: ""),
//   Pastors(name: "Ps. Winnie Malinga", image: ""),
//   Pastors(name: "Ps. Winnie Malinga", image: ""),
//   Pastors(name: "Ps. Nancy Baguma", image: ""),
//   Pastors(name: "Ps. Mark Tugume", image: ""),
//   Pastors(name: "Ps. Emma Businge", image: ""),
//   Pastors(name: "Ps.Ankunda Andrew", image: ""),
//   Pastors(name: "PPs.Nathan J Onyango", image: ""),
//   Pastors(name: "Ps. Rhian Mikisa Onyango", image: ""),
//   Pastors(name: "Ps. Fiona Atukunda", image: ""),
//   Pastors(name: "Ps. Jonan Kandwanaho", image: ""),
// ];
