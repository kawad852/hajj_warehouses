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
  static CollectionReference<InventoryOperationModel> get inventoryOperations => kUserDocRef
      .collection(MyCollections.inventoryOperations)
      .withConverter<InventoryOperationModel>(
        fromFirestore: (snapshot, _) => InventoryOperationModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
}
