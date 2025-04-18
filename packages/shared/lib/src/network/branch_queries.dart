import 'package:shared/shared.dart';

extension SelectedUserFireExtension on FirebaseFirestore {
  CollectionReference<CategoryModel> get branchCategories => kBranchDocRef
      .collection(MyCollections.categories)
      .withConverter<CategoryModel>(
        fromFirestore: (snapshot, _) => CategoryModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
}
