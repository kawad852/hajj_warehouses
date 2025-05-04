import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  late Query<TransactionModel> _query;

  void _initialize() {
    _query = kFirebaseInstant.transactions.whereMyBranch.orderByDesc;
  }

  void _openSheet(BuildContext context, {required TransactionType type}) {
    context.showBottomSheet(
      context,
      builder: (context) {
        return TransactionInputScreen(transactionType: type);
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
    return BranchSelector(
      builder: (context, branch) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: context.colorPalette.primary,
            leading: CustomBack(color: context.colorPalette.white),
            title: AppBarText("العهدة", color: context.colorPalette.white),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
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
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            height: 135,
            child: Column(
              children: [
                StretchedButton(
                  onPressed: () {
                    _openSheet(context, type: TransactionType.withdrawal);
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
                    _openSheet(context, type: TransactionType.deposit);
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Text(
                      "عمليات تمت على العهدة",
                      style: TextStyle(
                        color: context.colorPalette.black001,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: transactions.length,
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      itemBuilder: (context, index) {
                        if (snapshot.isLoadingMore(index)) {
                          return const FPLoading();
                        }
                        final transaction = transactions[index].data();
                        return TransactionCard(transaction: transaction);
                      },
                    ),
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
