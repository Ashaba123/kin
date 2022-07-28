import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/declaration.dart';

abstract class IDeclarationRepository {
  Stream<List<QueryDocumentSnapshot<Declaration>>> getKinDeclaration();
}

class DeclarationRepository extends IDeclarationRepository {
  final declarRef = FirebaseFirestore.instance
      .collection('declaration')
      .withConverter<Declaration>(
        fromFirestore: (snapshot, _) => Declaration.fromJson(snapshot.data()!),
        toFirestore: (devotion, _) => devotion.toJson(),
      );

  @override
  Stream<List<QueryDocumentSnapshot<Declaration>>> getKinDeclaration() {
    return declarRef.get().then((snapshot) => snapshot.docs).asStream();
  }
}
