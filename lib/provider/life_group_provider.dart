import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/life_groups_model.dart';
import 'package:kin/repositories/life_group_repository.dart';

class LifeGroupProvider {
  final ILifeGroupRepository iLifeGroupRepository;
  LifeGroupProvider({required this.iLifeGroupRepository});

  Stream<List<QueryDocumentSnapshot<LifeGroupsModel>>> getAllLifeGroups() {
    return iLifeGroupRepository.getAllLifeGroups();
  }
}
