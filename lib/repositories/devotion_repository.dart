import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/devotion.dart';

abstract class IDevotionRepository {
  Stream<List<QueryDocumentSnapshot<Devotion>>> getAllDevotions();
}

class DevotionRepository extends IDevotionRepository {
  final devotionsRef = FirebaseFirestore.instance
      .collection('devotions')
      .withConverter<Devotion>(
        fromFirestore: (snapshot, _) => Devotion.fromJson(snapshot.data()!),
        toFirestore: (devotion, _) => devotion.toJson(),
      );

  @override
  Stream<List<QueryDocumentSnapshot<Devotion>>> getAllDevotions() {
    return devotionsRef.get().then((snapshot) => snapshot.docs).asStream();
  }
}
