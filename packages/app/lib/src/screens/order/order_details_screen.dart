import 'package:app/screens_exports.dart';
import 'package:app/src/screens/order/widgets/order_history_card.dart';
import 'package:shared/object_box_exports.dart';
import 'package:shared/shared.dart';

class OrderDetailsScreen extends StatefulWidget {
  final OrderModel? order;
  final String? id;

  const OrderDetailsScreen({super.key, this.order, this.id});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late Stream<OrderModel> _orderStream;
  late Stream<QuerySnapshot<OrderHistoryModel>> _orderHistoryStream;

  OrderModel? get _order => widget.order;
  DocumentReference<OrderModel> get _docREF => kFirebaseInstant.orders.doc(widget.id ?? _order?.id);

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

  void _updateOrderStatus(String status, String type) {
    ApiService.fetch(
      context,
      callBack: () async {
        final batch = kFirebaseInstant.batch();
        batch.update(_docREF, {MyFields.status: status});
        final orderHistoryDocRef = _docREF.collection(MyCollections.orderHistory).doc();
        final history = OrderHistoryModel(
          status: status,
          user: kCurrentLightUser,
          branch: kBranch!,
          time: kNowDate,
          operationType: type,
        );
        batch.set(orderHistoryDocRef, history.toJson());
        await batch.commit();
      },
    );
  }

  Future<void> _showItemsDialog(BuildContext context, List<LightItemModel> items) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(context.appLocalization.items),
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
          appBar: AppBar(title: AppBarText("${context.appLocalization.orderNumber} ${order.id}#")),
          bottomNavigationBar:
              order.status == OrderStatusEnum.placed.value && kIsAdmin
                  ? BottomAppBar(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: StretchedButton(
                            onPressed: () {
                              _updateOrderStatus(
                                OrderStatusEnum.approved.value,
                                operation.operationType,
                              );
                            },
                            child: Text(
                              context.appLocalization.acceptOrder,
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
                                _updateOrderStatus(
                                  OrderStatusEnum.rejected.value,
                                  operation.operationType,
                                );
                              }
                            },
                            backgroundColor: context.colorPalette.redC10,
                            child: Text(
                              context.appLocalization.rejectOrder,
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
                        "${context.appLocalization.requestStatus} : ${operation.requestType == RequestTypeEnum.normal.value ? context.appLocalization.normal : context.appLocalization.urgent}",
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
              const SizedBox(height: 10),
              OrderCard(
                child: Text(
                  "${context.appLocalization.orderTime} : ${DateFormat.yMd(context.languageCode).add_jm().format(order.createdAt!)}",
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
                                "${operation.items.length} ${context.appLocalization.itemsInOrder}",
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
                            context.appLocalization.receiveOrder,
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
              if (order.operation?.notes != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ListBody(
                    children: [
                      Text(
                        context.appLocalization.notesAboutOrder,
                        style: TextStyle(
                          color: context.colorPalette.black001,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextEditor(
                        readOnly: true,
                        initialValue: order.operation!.notes,
                        onChanged: (value) {},
                      ),
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
                  context.appLocalization.actionsTakenOnOrder,
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
                      return OrderHistoryCard(history: history);
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
