import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class OrdersManagementScreen extends StatefulWidget {
  const OrdersManagementScreen({super.key});

  @override
  State<OrdersManagementScreen> createState() => _OrdersManagementScreenState();
}

class _OrdersManagementScreenState extends State<OrdersManagementScreen> {
  late Query<OrderModel> _query;

  void _initialize() {
    _query = kFirebaseInstant.orders.whereMyBranch.orderBy(MyFields.createdAt, descending: true);
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: StretchedButton(
          onPressed: () {
            context.push((context) => const OrderInputScreen());
          },
          child: Text(
            "ارسال طلب جديد",
            style: TextStyle(
              color: context.colorPalette.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBack(),
        title: const AppBarText("ادارة الطلبيات"),
      ),
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
                  context.push((context) => const OrderScreen());
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
                      const OrderStatus(),
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
