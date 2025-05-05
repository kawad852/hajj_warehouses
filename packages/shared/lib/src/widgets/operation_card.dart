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
            return "${e.quantity} ${context.appLocalization.unit} ";
          }
          return "${e.quantity} ${context.appLocalization.unit} ${e.name}";
        })
        .join(', ');
    switch (operationType) {
      case OperationType.create:
        return (context.appLocalization.create, _singleItem ? context.appLocalization.item : itemsLabel);
      case OperationType.add:
        return (context.appLocalization.add, itemsLabel);
      case OperationType.supply:
        return (context.appLocalization.supplyRequest, itemsLabel);
      case OperationType.destroy:
        return (context.appLocalization.destroy, itemsLabel);
      case OperationType.withdraw:
        return (context.appLocalization.withdraw, itemsLabel);
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
