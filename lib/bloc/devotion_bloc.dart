import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/devotion_model.dart';
import 'package:kin/repositories/devotion_repository.dart';

class DevotionBloc {
  final IDevotionRepository iDevotionRepository;
  
  DevotionBloc({required this.iDevotionRepository});

  Stream<List<QueryDocumentSnapshot<Devotion>>> getAllDevotions() {
    return iDevotionRepository.getAllDevotions();
  }
}
