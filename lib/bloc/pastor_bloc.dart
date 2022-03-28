import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/pastors.dart';
import 'package:kin/repositories/pastors_repository.dart';

class PastorBloc {
  final IPastoryRepository iPastoryRepository;
  PastorBloc({required this.iPastoryRepository});

  Stream<List<QueryDocumentSnapshot<PastorsModel>>> getAllPastors() {
    return iPastoryRepository.getAllPastors();
  }
}
