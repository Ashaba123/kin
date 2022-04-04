import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/sermon_model.dart';

abstract class ISermonRepository {
  Stream<List<QueryDocumentSnapshot<SermonModel>>> getAllSermons();
}

class SermonRepository extends ISermonRepository {
  final sermonRef = FirebaseFirestore.instance
      .collection('sermons')
      .withConverter<SermonModel>(
          fromFirestore: ((snapshot, options) =>
              SermonModel.fromJson(snapshot.data()!)),
          toFirestore: (sermons, _) => sermons.toJson());

  @override
  Stream<List<QueryDocumentSnapshot<SermonModel>>> getAllSermons() {
    return sermonRef.get().then((snapshot) => snapshot.docs).asStream();
  }
  
}
