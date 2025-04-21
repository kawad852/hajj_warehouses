import '../../shared.dart';

class InventoryProvider extends ChangeNotifier {
  void updateInventory(
    BuildContext context, {
    required List<ItemModel> items,
    required String operationType,
    String? destroyReason,
    String? notes,
    String? supplyType,
    int quantity = 0,
    double totalPayment = 0.0,
    List<String> images = const [],
  }) {
    ApiService.fetch(
      context,
      callBack: () async {
        final batch = kFirebaseInstant.batch();
        for (var e in items) {
          e.id = await e.getId();
          e.createdAt = kNowDate;
          e.status = _getItemStatus(
            availableQuantity: e.availableQuantity,
            minimumQuantity: e.minimumQuantity,
          );
          final itemDoc = kFirebaseInstant.items.doc(e.id);
          batch.set(itemDoc, e);
        }
        final operationDocREF = BranchQueries.inventoryOperations.doc();
        final operation = InventoryOperationModel(
          createdAt: kNowDate,
          id: operationDocREF.id,
          displayName: MySharedPreferences.user!.displayName!,
          operationType: operationType,
          totalPayment: totalPayment,
          destroyReason: destroyReason,
          quantity: quantity,
          images: images,
          notes: notes,
          supplyType: supplyType,
          items:
              items
                  .map((e) => LightItemModel(id: e.id, name: e.name, quantity: e.minimumQuantity))
                  .toList(),
          itemIds: items.map((e) => e.id).toList(),
        );
        batch.set(operationDocREF, operation);
        await batch.commit();
        if (context.mounted) {
          Fluttertoast.showToast(msg: context.appLocalization.addedSuccessfully);
          context.pop();
        }
      },
    );
  }

  String _getItemStatus({required int availableQuantity, required int minimumQuantity}) {
    if (availableQuantity <= 0) {
      return ItemStatusEnum.outOfStock.value;
    } else if (availableQuantity > 0 && availableQuantity < minimumQuantity) {
      return ItemStatusEnum.lowStock.value;
    } else {
      return ItemStatusEnum.inStock.value;
    }
  }
}
