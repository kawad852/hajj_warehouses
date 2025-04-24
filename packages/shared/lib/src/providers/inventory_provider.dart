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

        final needsApproval =
            operation.operationType == OperationType.supply.value ||
            operation.operationType == OperationType.transfer.value;
        operation.orderStatus == null;

        if (onCreate != null) {
          final items = await onCreate(batch);
          operation.items =
              items
                  .map((e) => LightItemModel(id: e.id, name: e.name, quantity: e.minimumQuantity))
                  .toList();
          operation.itemIds = items.map((e) => e.id).toList();
        }

        if (!needsApproval) {
          final isPlus = operation.operationType == OperationType.add.value;
          for (var e in operation.items) {
            final increment = e.increment;
            final status = _getItemStatus(
              availableQuantity: isPlus ? e.quantity + increment : e.quantity - increment,
              minimumQuantity: e.minimumQuantity,
            );
            final itemDoc = kFirebaseInstant.items.doc(e.id);
            final json = e.toJson();
            json[MyFields.quantity] = FieldValue.increment(isPlus ? increment : -increment);
            json[MyFields.status] = status;
            e.quantity = e.increment;
            batch.update(itemDoc, json);
          }
        }

        final operationDocREF = BranchQueries.inventoryOperations.doc();

        //Files
        List<String> images = [];
        if (operation.files != null) {
          images = await _storageService.uploadFiles(
            MyCollections.inventoryOperations,
            operation.files!,
          );
        }

        operation = operation.copyWith(
          createdAt: kNowDate,
          id: operationDocREF.id,
          user: LightUserModel(
            id: MySharedPreferences.user!.id!,
            displayName: MySharedPreferences.user!.displayName!,
          ),
          images: images,
          itemIds: operation.items.map((e) => e.id).toList(),
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
