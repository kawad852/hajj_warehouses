import 'package:intl/intl.dart';
import 'package:shared/shared.dart';

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
      case OperationType.destroy:
        return ("إتلاف", itemsLabel);
      default:
        return ("", "");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (itemId != null) {
      operation.items.removeWhere((e) => e.id != itemId);
    }
    final style = TextStyle(
      color: context.colorPalette.black001,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.cairo().fontFamily!,
    );
    final labels = _getLabels(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin: const EdgeInsetsDirectional.only(bottom: 5, start: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF2F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: style,
              children: [
                TextSpan(text: "قام"),
                TextSpan(
                  text: " ${operation.user?.displayName} ",
                  style: style.copyWith(color: context.colorPalette.grey708),
                ),
                TextSpan(text: "بـ ${labels.$1} "),
                TextSpan(text: labels.$2),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              DateFormat.yMd().add_jm().format(operation.createdAt!),
              style: TextStyle(
                color: context.colorPalette.grey666,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
