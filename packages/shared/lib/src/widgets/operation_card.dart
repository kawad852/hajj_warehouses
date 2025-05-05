import 'package:shared/shared.dart';
import 'package:shared/src/widgets/base_card.dart';

class OperationCard extends StatelessWidget {
  final InventoryOperationModel operation;
  final String? itemId;

  const OperationCard({super.key, required this.operation, this.itemId});

  bool get _singleItem => itemId != null;

  (String, String) _getLabels(BuildContext context) {
    final operationType = OperationType.values.firstWhere(
      (e) => e.value == operation.operationType,
    );
    final itemsLabel = operation.items
        .map((e) {
          if (itemId != null) {
            return "${e.quantity} وحدة ";
          }
          return "${e.quantity} وحدة ${e.name}";
        })
        .join(', ');
    switch (operationType) {
      case OperationType.create:
        return ("إنشاء", _singleItem ? 'الصنف' : itemsLabel);
      case OperationType.add:
        return ("إضافة", itemsLabel);
      case OperationType.supply:
        return ("طلب تزويد", itemsLabel);
      case OperationType.destroy:
        return ("إتلاف", itemsLabel);
      case OperationType.withdraw:
        return ("سحب", itemsLabel);
      default:
        return ("", "");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (itemId != null) {
      operation.items.removeWhere((e) => e.id != itemId);
    }
    final labels = _getLabels(context);
    return BaseCard(
      displayName: operation.user.displayName!,
      action1: labels.$1,
      action2: labels.$2,
      date: operation.createdAt!,
    );
  }
}
