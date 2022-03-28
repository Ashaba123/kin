import 'package:firebase_storage/firebase_storage.dart';

class EventModel {
  EventModel({this.imgUrl, this.ref});

  String? imgUrl;
  Reference? ref;
}
