import 'package:shared/shared.dart';

extension SelectedUserFireExtension on FirebaseFirestore {
  // CollectionReference<CategoryModel> get branchCategories => kUserDocRef
  //     .collection(MyCollections.categories)
  //     .withConverter<CategoryModel>(
  //       fromFirestore: (snapshot, _) => CategoryModel.fromJson(snapshot.data()!),
  //       toFirestore: (snapshot, _) => snapshot.toJson(),
  //     );
}

// extension BranchQueries on DocumentReference {
//   CollectionReference<OperationModel> get operationsQ => operations;
// }

class BranchQueries {
  static Query<OperationModel> get operations => kUserDocRef
      .collection(MyCollections.operations)
      .withConverter<OperationModel>(
        fromFirestore: (snapshot, _) => OperationModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      )
      .orderBy(MyFields.createdAt, descending: true);
}
