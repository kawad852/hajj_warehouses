import 'package:shared/src/helper/storage_service.dart';

import '../../shared.dart';

class InventoryProvider extends ChangeNotifier {
  final _storageService = StorageService();

  void createOperation(
    BuildContext context, {
    required InventoryOperationModel operation,
    Future<List<ItemModel>> Function(WriteBatch bath)? onCreate,
    Function(WriteBatch bath)? onCompleteOrder,
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
          if (onCompleteOrder != null) {
            onCompleteOrder(batch);
          }
          final isPlus = isAddOperation;
          for (var e in operation.items) {
            final increment = e.quantity;
            final itemDoc = kFirebaseInstant.items.doc(e.id);
            final json = e.toJson();
            json[MyFields.quantity] = FieldValue.increment(isPlus ? increment : -increment);
            batch.update(itemDoc, json);
          }
        }

        ///Files
        List<String> images = [];
        if (operation.files != null) {
          images = await _storageService.uploadFiles(
            MyCollections.inventoryOperations,
            operation.files!,
          );
        }

        ///Operation
        final user = kCurrentLightUser;
        operation = operation.copyWith(
          createdAt: kNowDate,
          id: await operation.getId(),
          user: user,
          images: images,
          itemIds: operation.items.map((e) => e.id).toList(),
        );

        if (needsApproval) {
          final order = OrderModel(
            createdAt: kNowDate,
            status: OrderStatusEnum.placed.value,
            operation: operation,
            user: user,
            branchId: kSelectedBranchId,
          );
          order.id = await order.getId();
          order.orderRecords = [
            OrderRecordModel(
              status: order.status,
              user: user,
              time: kNowDate,
              branchId: kSelectedBranchId,
            ),
          ];
          final orderDocREF = kFirebaseInstant.orders.doc(order.id);
          batch.set(orderDocREF, order);
        } else {
          final operationDocREF = kFirebaseInstant.inventoryOperations.doc(operation.id);
          batch.set(operationDocREF, operation);
        }

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
