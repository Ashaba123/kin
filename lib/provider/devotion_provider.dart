import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/devotion.dart';
import 'package:kin/repositories/devotion_repository.dart';

class DevotionProvider {
  final IDevotionRepository iDevotionRepository;

  DevotionProvider({required this.iDevotionRepository});

  Stream<List<QueryDocumentSnapshot<Devotion>>> getAllDevotions() {
    return iDevotionRepository.getAllDevotions();
  }
}
