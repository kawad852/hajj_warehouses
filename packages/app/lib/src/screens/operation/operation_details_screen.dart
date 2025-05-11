import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class OperationDetailsScreen extends StatefulWidget {
  final InventoryOperationModel? operation;
  final String? operationId;

  const OperationDetailsScreen({super.key, this.operation, this.operationId});

  @override
  State<OperationDetailsScreen> createState() => _OperationDetailsScreenState();
}

class _OperationDetailsScreenState extends State<OperationDetailsScreen> {
  late Future<InventoryOperationModel> _future;

  void _initialize() {
    if (widget.operationId != null) {
      _future = kFirebaseInstant.inventoryOperations.doc(widget.operationId).get().then((value) {
        return value.data()!;
      });
    } else {
      _future = Future.value(widget.operation);
    }
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarText(context.appLocalization.processDetails)),
      body: ImpededFutureBuilder(
        future: _future,
        onComplete: (context, snapshot) {
          final operation = snapshot.data!;

          final operationTypeEnum = OperationType.values.firstWhere(
            (e) => e.value == operation.operationType,
          );
          final isCreateOperation = operationTypeEnum == OperationType.create;
          final info =
              isCreateOperation
                  ? null
                  : operationTypeEnum.getInfo(context, operation.items.length == 1);

          String? radioValue;

          if (operation.supplyType != null) {
            radioValue = operation.supplyType;
          } else if (operation.destroyReason != null) {
            radioValue = operation.destroyReason;
          } else if (operation.requestType != null) {
            radioValue = operation.requestType;
          }

          return Padding(
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

                if (info?.radio != null && radioValue != null)
                  OperationBubble(
                    title: info!.radio!.label,
                    value:
                        info.radio!.items
                            .firstWhere(
                              (e) => e.value == radioValue,
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
          );
        },
      ),
    );
  }
}
