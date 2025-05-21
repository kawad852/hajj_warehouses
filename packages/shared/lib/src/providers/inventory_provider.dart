import 'package:app/screens_exports.dart';

import '../../shared.dart';

class InventoryProvider extends ChangeNotifier {
  final _storageService = StorageService();

  void createOperation(
    BuildContext context, {
    required InventoryOperationModel operation,
    Future<List<ItemModel>> Function(WriteBatch bath)? onCreate,
    String? transferToBranchId,
    (String, String)? orderValues,
    bool updateBalance = false,
  }) async {
    // ApiService.fetch(
    //   context,
    //   callBack: () async {
    final batch = kFirebaseInstant.batch();
    final user = kCurrentLightUser;

    final isAddOperation = operation.operationType == OperationType.add.value;
    final isSupplyOperation = operation.operationType == OperationType.supply.value;
    final isTransferOperation = operation.operationType == OperationType.transfer.value;

    final createOrder = (isSupplyOperation || isTransferOperation) && orderValues == null;

    ///Items
    if (onCreate != null) {
      final items = await onCreate(batch);
      operation.items =
          items
              .map((e) => LightItemModel(id: e.id, name: e.name, quantity: e.minimumQuantity))
              .toList();
      operation.itemIds = items.map((e) => e.id).toList();
    } else if (!isSupplyOperation) {
      if (orderValues != null) {
        final id = orderValues.$1;
        final status = orderValues.$2;
        final ref = kFirebaseInstant.orders.doc(id);
        batch.update(ref, {MyFields.status: status});
      }
      final isPlus = isAddOperation;
      for (var e in operation.items) {
        var itemDocRef = kFirebaseInstant.items.doc(e.id);
        if (transferToBranchId != null) {
          final documentSnapshot = await itemDocRef.get();
          final data = documentSnapshot.data()!;
          final newId = await RowIdHelper.get(RowIdHelper.itemId);
          var newDocRef = kFirebaseInstant.items.doc(newId);
          final docSnapshot =
              await kFirebaseInstant.items.whereIdBranch
                  .where(MyFields.name, isEqualTo: e.name)
                  .limit(1)
                  .get();
          if (docSnapshot.docs.isNotEmpty) {
            newDocRef = docSnapshot.docs.first.reference;
            newDocRef.update({MyFields.quantity: FieldValue.increment(e.quantity)});
          } else {
            final newData = data.copyWith(
              id: newId,
              quantity: e.quantity,
              user: user,
              branch: kBranch!,
            );
            batch.set(newDocRef, newData);
          }
        } else {
          final increment = e.quantity;
          final json = e.toJson();
          json[MyFields.quantity] = FieldValue.increment(isPlus ? increment : -increment);
          batch.update(itemDocRef, json);
        }
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
    operation = operation.copyWith(
      createdAt: kNowDate,
      id: await operation.getId(),
      user: user,
      images: images,
      itemIds: operation.items.map((e) => e.id).toList(),
    );

    if (updateBalance) {
      setTransaction(
        // ignore: use_build_context_synchronously
        context,
        batch,
        user: user,
        operationId: operation.id,
        amount: operation.amount ?? 0,
      );
    }

    if (createOrder) {
      final order = OrderModel(
        createdAt: kNowDate,
        status: OrderStatusEnum.placed.value,
        operation: operation,
        user: user,
        branch: isTransferOperation ? operation.transferToBranch! : kBranch!,
        transferFromBranch: operation.transferFromBranch,
        transferToBranch: operation.transferToBranch,
      );
      order.id = await order.getId();
      final orderDocREF = kFirebaseInstant.orders.doc(order.id);
      final orderHistoryDocRef = orderDocREF.collection(MyCollections.orderHistory).doc();
      final orderHistory = OrderHistoryModel(
        status: order.status,
        user: user,
        time: kNowDate,
        branch: kBranch!,
        operationType: operation.operationType,
      );
      batch.set(orderDocREF, order);
      batch.set(orderHistoryDocRef, orderHistory.toJson());
      if (isSupplyOperation && context.mounted) {
        Navigator.pop(context);
        context.navigate((context) {
          return OrderDetailsScreen(order: order);
        });
      }
    } else {
      final operationDocREF = kFirebaseInstant.inventoryOperations.doc(operation.id);
      batch.set(operationDocREF, operation);
    }

    await batch.commit();
    if (context.mounted) {
      Fluttertoast.showToast(msg: context.appLocalization.addedSuccessfully);
      if (!createOrder) {
        Navigator.pop(context);
      }
    }
    // },
    // );
  }

  void setTransaction(
    BuildContext context,
    WriteBatch batch, {
    required LightUserModel user,
    required String operationId,
    required double amount,
  }) {
    final walletDocRef = kFirebaseInstant.transactions.doc();
    final transaction = TransactionModel(
      createdAt: kNowDate,
      id: walletDocRef.id,
      branch: kBranch!,
      transactionType: TransactionType.withdrawal.value,
      operationId: operationId,
      amount: amount,
      user: user,
    );
    final branchDocRef = kFirebaseInstant.branches.doc(kSelectedBranchId);
    batch.update(branchDocRef, {MyFields.balance: FieldValue.increment(-amount)});
    batch.set(walletDocRef, transaction);
  }
}
