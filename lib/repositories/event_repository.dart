import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:kin/models/events_model.dart';

abstract class IEventRepository {
  Stream<List<QueryDocumentSnapshot<EventModel>>> getAllEvents();
}

