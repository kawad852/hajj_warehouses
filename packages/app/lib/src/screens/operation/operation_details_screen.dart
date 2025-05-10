import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class OperationDetailsScreen extends StatelessWidget {
  final InventoryOperationModel operation;

  const OperationDetailsScreen({super.key, required this.operation});

  String? get _getRadioValue {
    // if (operation.destroyReason != null) {
    //   final value = DestroyReasonEnum.values.firstWhere((e) => e.value == operation.destroyReason);
    //   if (value == DestroyReasonEnum.spoiled) {
    //     return "";
    //   } else {
    //     return "";
    //   }
    // } else if (operation.supplyType != null) {
    //   final value = SupplyTypeEnum.values.firstWhere((e) => e.value == operation.supplyType);
    //   if (value == SupplyTypeEnum.orderReceiving) {
    //     return "";
    //   } else {
    //     return "";
    //   }
    // }
    if (operation.supplyType != null) {
      return operation.supplyType;
    } else if (operation.destroyReason != null) {
      return operation.destroyReason;
    } else if (operation.requestType != null) {
      return operation.requestType;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final operationTypeEnum = OperationType.values.firstWhere(
      (e) => e.value == operation.operationType,
    );
    final info = operationTypeEnum.getInfo(context, operation.items.length == 1);
    return Scaffold(
      appBar: AppBar(title: AppBarText(context.appLocalization.processDetails)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OperationBubble(
              title: context.appLocalization.items,
              value: operation.items.map((e) => "${e.quantity} ${e.name}").join(', '),
            ),

            if (operation.amount != null)
              OperationBubble(
                title: context.appLocalization.totalAmount,
                value: "${operation.amount} ${context.currency}",
              ),

            if (info.radio != null)
              OperationBubble(
                title: info.radio!.label,
                value:
                    info.radio!.items
                        .firstWhere(
                          (e) => e.value == _getRadioValue,
                          orElse: () => RadioModel(label: "", value: ""),
                        )
                        .label,
              ),

            if (operation.notes != null)
              TitledTextField(
                title: context.appLocalization.explanationsAndNotes,
                textStyle: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
                child: BaseEditor(
                  initialValue: operation.notes!,
                  filled: true,
                  readOnly: true,
                  fillColor: Colors.transparent,
                  maxLines: 4,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: context.colorPalette.grey666),
                    borderRadius: BorderRadius.circular(kRadiusSecondary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: context.colorPalette.grey666),
                    borderRadius: BorderRadius.circular(kRadiusSecondary),
                  ),
                ),
              ),

            if (operation.images.isNotEmpty) ...[
              Text(
                context.appLocalization.picturesAttached,
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(width: 10),
                  itemCount: operation.images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final image = operation.images[index];
                    return BaseNetworkImage(image, width: 90, height: 90);
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
