import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/store/store_model.dart';

class DummyData {
  final dummyRestaurant = StoreModel(
    createdAt: DateTime.now(),
    id: "restaurant123",
    nameEn: "The Flutter Diner",
    nameAr: "مطعم فلاتر",
    descriptionEn: "Serving the best Flutter-inspired dishes in town.",
    descriptionAr: "يقدم أفضل الأطباق المستوحاة من فلاتر في المدينة.",
    stateId: "state001",
    cityId: "city001",
    address: "123 Main Street, Flutter City",
    status: "PENDING",
    type: "food",
    thumbnail: "https://example.com/thumbnail.jpg",
    images: ["https://example.com/image1.jpg", "https://example.com/image2.jpg"],
    phoneNumber: "1234567890",
    phoneCountryCode: "+1",
  );

  void addRestaurant() {
    FirebaseFirestore.instance.collection('foodStores').doc().set(dummyRestaurant.toJson());
  }
}
