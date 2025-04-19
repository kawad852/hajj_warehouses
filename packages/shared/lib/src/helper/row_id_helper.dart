import '../../shared.dart';

class RowIdHelper {
  static const String orderId = 'order_id';
  static const String itemId = 'item_id';
  static const String categoryId = 'category_id';

  static Future<String> getOrderId(String fieldName) async {
    var newOrderId = 0;
    final orderIdDocumentRef = kFirebaseInstant
        .collection(MyCollections.settings)
        .doc(kRowIdDocument);
    await kFirebaseInstant.runTransaction((Transaction transaction) async {
      final snapshot = await transaction.get(orderIdDocumentRef);
      newOrderId = snapshot.data()![fieldName];
      transaction.update(orderIdDocumentRef, {fieldName: FieldValue.increment(1)});
    });
    return '$newOrderId';
  }
}
