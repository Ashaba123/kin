import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/testimony_model.dart';
import 'package:kin/repositories/testimony_repository.dart';

class TestimonyBloc {
  final ITestimonyRepository iTestimonyRepository;
  TestimonyBloc({required this.iTestimonyRepository});

  Stream<List<QueryDocumentSnapshot<TestimonyModel>>> getAllTestimonies() {
    return iTestimonyRepository.getAllTestimonies();
  }
}
