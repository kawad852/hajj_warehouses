import 'package:shared/shared.dart';

import '../models/country/country_model.dart';
import '../models/order/order_model.dart';
import '../models/policy/policy_model.dart';
import '../models/promo_code/promo_code_model.dart';
import '../models/store/store_model.dart';

extension CollectionReferenceExtension on FirebaseFirestore {
  CollectionReference<UserModel> get users =>
      collection(MyCollections.users).withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<StoreModel> get foodStores =>
      collection(MyCollections.foodStores).withConverter<StoreModel>(
        fromFirestore: (snapshot, _) => StoreModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<CountryModel> get countries =>
      collection("countries").withConverter<CountryModel>(
        fromFirestore: (snapshot, _) => CountryModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<CategoryModel> get categories =>
      collection(MyCollections.categories).withConverter<CategoryModel>(
        fromFirestore: (snapshot, _) => CategoryModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<PromoCodeModel> get promoCodes =>
      collection(MyCollections.promoCodes).withConverter<PromoCodeModel>(
        fromFirestore: (snapshot, _) => PromoCodeModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  DocumentReference<ProductModel> meal(String storeId, String productId) {
    return foodStores
        .doc(storeId)
        .collection("menu")
        .doc(productId)
        .withConverter<ProductModel>(
          fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson(),
        );
  }

  CollectionReference<OrderModel> get orders =>
      collection(MyCollections.orders).withConverter<OrderModel>(
        fromFirestore: (snapshot, _) => OrderModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<ProductModel> get products =>
      collection(MyCollections.products).withConverter<ProductModel>(
        fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<PolicyModel> get policies =>
      collection(MyCollections.policies).withConverter<PolicyModel>(
        fromFirestore: (snapshot, _) => PolicyModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
}
