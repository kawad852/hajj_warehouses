import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class OrderDetailsScreen extends StatefulWidget {
  final OrderModel order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late Stream<OrderModel> _operationStream;

  OrderModel get _operation => widget.order;

  void _initialize() {
    _operationStream = kFirebaseInstant.orders.doc(_operation.id).snapshots().map((e) => e.data()!);
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BigStreamBuilder(
      stream: _operationStream,
      initialData: _operation,
      onComplete: (context, snapshot) {
        final order = snapshot.data!;
        final operation = order.operation!;
        return Scaffold(
          appBar: AppBar(title: AppBarText("طلب رقم ${order.id}#")),
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            child: Row(
              children: [
                Expanded(
                  child: StretchedButton(
                    onPressed: () {},
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
                    onPressed: () {},
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
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children: [
              OrderCard(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "حالة الطلب : ${operation.requestType}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.black001,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const OrderStatus(),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              OrderCard(
                child: Text(
                  "وقت الطلب : ${order.createdAt}",
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
                        onPressed: () {},
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
                    const SizedBox(width: 10),
                    Expanded(
                      child: StretchedButton(
                        onPressed: () {},
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
              ProcessTimeLine(
                itemCount: order.orderRecords.length,
                contentsBuilder: (context, index) {
                  final record = order.orderRecords[index];
                  return OperationCard(
                    operation: InventoryOperationModel(
                      createdAt: kNowDate,
                      operationType: '',
                      supplyType: '',
                      user: record.user,
                      files: [],
                      items: [],
                    ),
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
