import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/store/store_model.dart';

extension DocReferenceExtension on DocumentReference {
  CollectionReference<ProductModel> get meals => collection("menu").withConverter<ProductModel>(
        fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
}
