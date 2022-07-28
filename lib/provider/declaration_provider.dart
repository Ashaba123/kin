import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/declaration.dart';
import 'package:kin/repositories/declaration_repository.dart';

class DeclarationProvider {
  final IDeclarationRepository iDeclarationRepository;

  DeclarationProvider({required this.iDeclarationRepository});

  Stream<List<QueryDocumentSnapshot<Declaration>>> getKinDeclaration() {
    return iDeclarationRepository.getKinDeclaration();
  }
}
