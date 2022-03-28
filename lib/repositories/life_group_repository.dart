import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/life_groups_model.dart';

abstract class ILifeGroupRepository {
  Stream<List<QueryDocumentSnapshot<LifeGroupsModel>>> getAllLifeGroups();
}

class LifeGroupRepository extends ILifeGroupRepository {
  final lifeGroupRef = FirebaseFirestore.instance
      .collection('life-groups')
      .withConverter<LifeGroupsModel>(
          fromFirestore: ((snapshot, _) =>
              LifeGroupsModel.fromJson(snapshot.data()!)),
          toFirestore: (testimony, _) => testimony.toJson());

  @override
  Stream<List<QueryDocumentSnapshot<LifeGroupsModel>>> getAllLifeGroups() {
    return lifeGroupRef.get().then((snapshot) => snapshot.docs).asStream();
  }
}
