import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/pastors.dart';

abstract class IPastoryRepository {
  Stream<List<QueryDocumentSnapshot<PastorsModel>>> getAllPastors();
}

class PastorRepostory extends IPastoryRepository {
  final pastorRef = FirebaseFirestore.instance
      .collection('pastors')
      .withConverter<PastorsModel>(
          fromFirestore: ((snapshot, options) =>
              PastorsModel.fromJson(snapshot.data()!)),
          toFirestore: (pastors, _) => pastors.toJson());

  @override
  Stream<List<QueryDocumentSnapshot<PastorsModel>>> getAllPastors() {
    return pastorRef.get().then((snapshot) => snapshot.docs).asStream();
  }
}
