import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late Query<OrderModel> _query;

  void _initialize() {
    _query = kFirebaseInstant.orders.whereMyBranch.orderByDesc;
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     try {
      //       final d = await kFirebaseInstant.orders.whereMyBranchNested.orderByDesc.get();
      //       print("idddd::: ${d.docs.length}");
      //     } catch (e) {
      //       print("alskfaslkf : $e");
      //     }
      //   },
      // ),
      bottomNavigationBar: BottomButton(
        text: "ارسال طلب جديد",
        onPressed: () {
          context.push(
            (context) => const OperationInputScreen(operationType: OperationType.supply),
          );
        },
      ),
      appBar: AppBar(title: const AppBarText("ادارة الطلبيات")),
      body: CustomFirestoreQueryBuilder(
        query: _query,
        onComplete: (context, snapshot) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: snapshot.docs.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              if (snapshot.isLoadingMore(index)) {
                return const FPLoading();
              }
              final order = snapshot.docs[index].data();
              return GestureDetector(
                onTap: () {
                  context.push((context) => OrderDetailsScreen(order: order));
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: context.colorPalette.greyF2F,
                    borderRadius: BorderRadius.circular(kRadiusSecondary),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "طلب رقم ${order.id}#",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: context.colorPalette.black001,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      OrderStatus(status: order.status),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
