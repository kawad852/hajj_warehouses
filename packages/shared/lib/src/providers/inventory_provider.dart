import 'package:shared/src/helper/storage_service.dart';

import '../../shared.dart';

class InventoryProvider extends ChangeNotifier {
  final _storageService = StorageService();

  void updateInventory(
    BuildContext context, {
    List<ItemModel>? createdItems,
    required InventoryOperationModel operation,
    required List<XFile> files,
  }) {
    ApiService.fetch(
      context,
      callBack: () async {
        final batch = kFirebaseInstant.batch();

        if (createdItems != null) {
          for (var e in createdItems) {
            final isUpdate = e.id.isNotEmpty;
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
        } else {
          for (var e in operation.items) {
            final status = _getItemStatus(
              availableQuantity: e.quantity,
              minimumQuantity: e.minimumQuantity,
            );
            final itemDoc = kFirebaseInstant.items.doc(e.id);
            batch.update(itemDoc, {...e.toJson(), MyFields.status: status});
          }
        }

        final operationDocREF = BranchQueries.inventoryOperations.doc();
        final images = await _storageService.uploadFiles(MyCollections.inventoryOperations, files);
        if (operation.id.isEmpty) {
          operation.id = operationDocREF.id;
          operation.createdAt = kNowDate;
        }
        operation = operation.copyWith(
          createdAt: kNowDate,
          id: operationDocREF.id,
          user: LightUserModel(
            id: MySharedPreferences.user!.id!,
            displayName: MySharedPreferences.user!.displayName!,
          ),
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

  void updateOrder(
    BuildContext context, {
    required List<ItemModel> items,
    required InventoryOperationModel operation,
    required List<XFile> files,
  }) {}

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
