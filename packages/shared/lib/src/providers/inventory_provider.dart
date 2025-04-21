import 'package:shared/src/helper/storage_service.dart';

import '../../shared.dart';

class InventoryProvider extends ChangeNotifier {
  final _storageService = StorageService();

  void updateInventory(
    BuildContext context, {
    required List<ItemModel> items,
    required InventoryOperationModel operation,
    List<XFile> files = const [],
  }) {
    ApiService.fetch(
      context,
      callBack: () async {
        final isUpdate = items.first.id.isNotEmpty;
        final batch = kFirebaseInstant.batch();
        for (var e in items) {
          if (!isUpdate) {
            e.id = await e.getId();
            e.createdAt = kNowDate;
          }
          e.status = _getItemStatus(
            availableQuantity: e.quantity,
            minimumQuantity: e.minimumQuantity,
          );
          final itemDoc = kFirebaseInstant.items.doc(e.id);
          if (isUpdate) {
            batch.update(itemDoc, e.toJson());
          } else {
            batch.set(itemDoc, e);
          }
        }
        final operationDocREF = BranchQueries.inventoryOperations.doc();
        final images = await _storageService.uploadFiles(MyCollections.inventoryOperations, files);
        if (operation.id.isEmpty) {
          operation.id = operationDocREF.id;
          operation.createdAt = kNowDate;
        }
        operation.displayName = MySharedPreferences.user!.displayName!;
        operation = operation.copyWith(
          createdAt: kNowDate,
          id: operationDocREF.id,
          displayName: MySharedPreferences.user!.displayName!,
          items:
              items
                  .map(
                    (e) => LightItemModel(
                      id: e.id,
                      name: e.name,
                      quantity:
                          operation.operationType == OperationType.create.value
                              ? e.minimumQuantity
                              : e.quantity,
                    ),
                  )
                  .toList(),
          itemIds: items.map((e) => e.id).toList(),
          images: images,
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
