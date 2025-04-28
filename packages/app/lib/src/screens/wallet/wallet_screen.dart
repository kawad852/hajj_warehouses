import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late Query<TransactionModel> _query;

  void _initialize() {
    _query = kFirebaseInstant.transactions.whereMyBranch.orderByDesc;
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BranchSelector(
      builder: (context, branch) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(140.0),
            child: AppBar(
              title: AppBarText("العهدة", color: context.colorPalette.white),
              leading: CustomBack(color: context.colorPalette.white),
              flexibleSpace: Container(
                height: 155,
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                color: context.colorPalette.grey708,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        branch.balance.toStringAsFixed(2),
                        style: TextStyle(
                          color: context.colorPalette.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                        textDirection: TextDirection.ltr,
                      ),
                      const SizedBox(width: 10),
                      CustomSvg(MyIcons.currency, color: context.colorPalette.white, width: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            height: 135,
            child: Column(
              children: [
                StretchedButton(
                  onPressed: () {
                    context.showBottomSheet(
                      context,
                      maxHeight: context.mediaQuery.height * 0.65,
                      builder: (context) {
                        return const DragMoney();
                      },
                    );
                  },
                  child: Text(
                    "تسجيل مصروف",
                    style: TextStyle(
                      color: context.colorPalette.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                StretchedButton(
                  onPressed: () {
                    context.showBottomSheet(
                      context,
                      maxHeight: context.mediaQuery.height * 0.73,
                      builder: (context) {
                        return const AddMoney();
                      },
                    );
                  },
                  child: Text(
                    "اضافة عهدة ( خاصة بالإدارة )",
                    style: TextStyle(
                      color: context.colorPalette.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: CustomFirestoreQueryBuilder(
            query: _query,
            onComplete: (context, snapshot) {
              final transactions = snapshot.docs;
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  Text(
                    "عمليات تمت على العهدة",
                    style: TextStyle(
                      color: context.colorPalette.black001,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    itemCount: transactions.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index].data();
                      return const WalletOperation();
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
