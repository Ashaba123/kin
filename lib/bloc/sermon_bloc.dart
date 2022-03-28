import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:kin/models/sermon_model.dart';
import 'package:kin/repositories/sermon_repository.dart';

class SermonBloc {
  final ISermonRepository iSermonRepository;
  SermonBloc({required this.iSermonRepository});

  Stream<List<QueryDocumentSnapshot<SermonModel>>> getAllSermons() {
    return iSermonRepository.getAllSermons();
  }
}
