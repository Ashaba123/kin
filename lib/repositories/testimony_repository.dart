import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/testimony_model.dart';

abstract class ITestimonyRepository {
  Stream<List<QueryDocumentSnapshot<TestimonyModel>>> getAllTestimonies();
}

class TestimonyRepository extends ITestimonyRepository {
  final testimonyRef = FirebaseFirestore.instance
      .collection('testimonies')
      .withConverter<TestimonyModel>(
          fromFirestore: ((snapshot, _) =>
              TestimonyModel.fromJson(snapshot.data()!)),
          toFirestore: (testimony, _) => testimony.toJson());

  @override
  Stream<List<QueryDocumentSnapshot<TestimonyModel>>> getAllTestimonies() {
    return testimonyRef.get().then((snapshot) => snapshot.docs).asStream();
  }
}
