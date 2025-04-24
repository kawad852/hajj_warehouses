import 'package:shared/src/helper/storage_service.dart';

import '../../shared.dart';

class InventoryProvider extends ChangeNotifier {
  final _storageService = StorageService();

  void createOperation(
    BuildContext context, {
    required InventoryOperationModel operation,
    Future<List<ItemModel>> Function(WriteBatch bath)? onCreate,
  }) {
    ApiService.fetch(
      context,
      callBack: () async {
        final batch = kFirebaseInstant.batch();

        final isAddOperation = operation.operationType == OperationType.add.value;
        final isSupplyOperation = operation.operationType == OperationType.supply.value;
        final isTransferOperation = operation.operationType == OperationType.transfer.value;

        final needsApproval = isSupplyOperation || isTransferOperation;

        ///Items
        if (onCreate != null) {
          final items = await onCreate(batch);
          operation.items =
              items
                  .map((e) => LightItemModel(id: e.id, name: e.name, quantity: e.minimumQuantity))
                  .toList();
          operation.itemIds = items.map((e) => e.id).toList();
        } else if (!needsApproval) {
          final isPlus = isAddOperation;
          for (var e in operation.items) {
            final increment = e.quantity;
            final itemDoc = kFirebaseInstant.items.doc(e.id);
            final json = e.toJson();
            json[MyFields.quantity] = FieldValue.increment(isPlus ? increment : -increment);
            batch.update(itemDoc, json);
          }
        }

        final operationDocREF = kFirebaseInstant.inventoryOperations.doc();

        ///Files
        List<String> images = [];
        if (operation.files != null) {
          images = await _storageService.uploadFiles(
            MyCollections.inventoryOperations,
            operation.files!,
          );
        }

        ///Operation
        operation = operation.copyWith(
          createdAt: kNowDate,
          id: operationDocREF.id,
          user: LightUserModel(
            id: MySharedPreferences.user!.id!,
            displayName: MySharedPreferences.user!.displayName!,
          ),
          images: images,
          itemIds: operation.items.map((e) => e.id).toList(),
          orderStatus: isSupplyOperation ? OrderStatusEnum.placed.value : null,
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

  String _getItemStatus({required int quantity, required int minimumQuantity}) {
    if (quantity <= 0) {
      return ItemStatusEnum.outOfStock.value;
    } else if (quantity > 0 && quantity < minimumQuantity) {
      return ItemStatusEnum.lowStock.value;
    } else {
      return ItemStatusEnum.inStock.value;
    }
  }
}
