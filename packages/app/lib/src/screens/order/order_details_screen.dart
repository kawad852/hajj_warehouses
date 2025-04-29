import 'package:app/screens_exports.dart';
import 'package:shared/object_box_exports.dart';
import 'package:shared/shared.dart';

class OrderDetailsScreen extends StatefulWidget {
  final OrderModel order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late Stream<OrderModel> _orderStream;
  late Stream<QuerySnapshot<OrderHistoryModel>> _orderHistoryStream;

  OrderModel get _order => widget.order;
  DocumentReference<OrderModel> get _docREF => kFirebaseInstant.orders.doc(_order.id);

  void _initialize() {
    _orderStream = _docREF.snapshots().map((e) => e.data()!);
    _orderHistoryStream =
        _docREF
            .collection(MyCollections.orderHistory)
            .withConverter<OrderHistoryModel>(
              fromFirestore: (snapshot, _) => OrderHistoryModel.fromJson(snapshot.data()!),
              toFirestore: (snapshot, _) => snapshot.toJson(),
            )
            .snapshots();
  }

  void _updateOrderStatus(String status) {
    final batch = kFirebaseInstant.batch();
    batch.update(_docREF, {MyFields.status: status});
    final orderHistoryDocRef = _docREF.collection(MyCollections.orderHistory).doc();
    final history = OrderHistoryModel(
      status: status,
      user: kCurrentLightUser,
      branchId: kSelectedBranchId,
      time: kNowDate,
    );
    batch.set(orderHistoryDocRef, history.toJson());
  }

  Future<void> _showItemsDialog(BuildContext context, List<LightItemModel> items) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('الأصناف'),
          children:
              items.map((e) {
                return SimpleDialogOption(child: Text("(${e.quantity}) ${e.name}"));
              }).toList(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BigStreamBuilder(
      stream: _orderStream,
      initialData: _order,
      onComplete: (context, snapshot) {
        final order = snapshot.data!;
        final operation = order.operation!;
        return Scaffold(
          appBar: AppBar(title: AppBarText("طلب رقم ${order.id}#")),
          bottomNavigationBar:
              order.status == OrderStatusEnum.placed.value && kIsAdmin
                  ? BottomAppBar(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: StretchedButton(
                            onPressed: () {
                              _updateOrderStatus(OrderStatusEnum.approved.value);
                            },
                            child: Text(
                              "قبول الطلب",
                              style: TextStyle(
                                color: context.colorPalette.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: StretchedButton(
                            onPressed: () {
                              if (operation.operationType == OperationType.transfer.value) {
                                context.inventoryProvider.createOperation(
                                  context,
                                  operation: operation.copyWith(
                                    operationType: OperationType.add.value,
                                  ),
                                  orderValues: (order.id, OrderStatusEnum.rejected.value),
                                );
                              } else {
                                _updateOrderStatus(OrderStatusEnum.rejected.value);
                              }
                            },
                            backgroundColor: context.colorPalette.redC10,
                            child: Text(
                              "رفض الطلب",
                              style: TextStyle(
                                color: context.colorPalette.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  : null,
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children: [
              OrderCard(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "حالة الطلب : ${operation.requestType == RequestTypeEnum.normal.value ? "عادية" : "طارئة"}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.black001,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    OrderStatusChip(status: order.status),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              OrderCard(
                child: Text(
                  "وقت الطلب : ${DateFormat.yMd(context.languageCode).add_jm().format(order.createdAt!)}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: StretchedButton(
                        onPressed: () {
                          _showItemsDialog(context, operation.items);
                        },
                        child: Row(
                          children: [
                            const CustomSvg(MyIcons.paperclip),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "${operation.items.length} اصناف في الطلب",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: context.colorPalette.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (order.status == OrderStatusEnum.approved.value && !kIsAdmin) ...[
                      const SizedBox(width: 10),
                      Expanded(
                        child: StretchedButton(
                          onPressed: () {
                            final transferToBranchId = order.transferToBranch?.id;
                            context.inventoryProvider.createOperation(
                              context,
                              operation: operation.copyWith(operationType: OperationType.add.value),
                              transferToBranchId: transferToBranchId,
                              orderValues: (order.id, OrderStatusEnum.completed.value),
                            );
                          },
                          backgroundColor: context.colorPalette.greyC4C,
                          child: Text(
                            "إستلام الطلب",
                            style: TextStyle(
                              color: context.colorPalette.black001,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // StretchedButton(
              //   onPressed: () {},
              //   child: Row(
              //     children: [
              //       const CustomSvg(MyIcons.map),
              //       Expanded(
              //         child: Text(
              //           "تتبع الطلب مباشرة على الخريطة",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //             color: context.colorPalette.white,
              //             fontSize: 14,
              //             fontWeight: FontWeight.w800,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "عمليات تمت على الطلب",
                  style: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              ImpededStreamBuilder(
                stream: _orderHistoryStream,
                onComplete: (context, snapshot) {
                  return ProcessTimeLine(
                    itemCount: snapshot.data!.docs.length,
                    contentsBuilder: (context, index) {
                      final history = snapshot.data!.docs[index].data();
                      return OperationCard(
                        operation: InventoryOperationModel(
                          createdAt: kNowDate,
                          operationType: 'ADD',
                          supplyType: '',
                          files: [],
                          items: [],
                          branchId: kSelectedBranchId,
                          user: kCurrentLightUser,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
