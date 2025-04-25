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
  static Query<InventoryOperationModel> get inventoryOperations =>
      kFirebaseInstant.inventoryOperations.whereMyBranch.orderByDesc;
}
