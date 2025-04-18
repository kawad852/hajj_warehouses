import '../../shared.dart';

class RowIdHelper {
  static Future<String> getOrderId() async {
    var newOrderId = 0;
    final orderIdDocumentRef = kFirebaseInstant
        .collection(MyCollections.settings)
        .doc(kOrderIdDocument);
    await kFirebaseInstant.runTransaction((Transaction transaction) async {
      final snapshot = await transaction.get(orderIdDocumentRef);
      newOrderId = snapshot.data()!['order_id'];
      transaction.update(orderIdDocumentRef, {'order_id': FieldValue.increment(1)});
    });
    return '$newOrderId';
  }
}
