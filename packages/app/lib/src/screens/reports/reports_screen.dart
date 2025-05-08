import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarText(context.appLocalization.reports)),
      bottomNavigationBar: BottomButton(
        text: context.appLocalization.addNewSection,
        onPressed: () {},
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          Text(
            context.appLocalization.changeReportingPeriod,
            style: TextStyle(
              color: context.colorPalette.grey666,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ReportsCard(
              icon: MyIcons.shop,
              title: "فرع منى",
              suffixText: context.appLocalization.changeBranch,
              onTapSuffix: () {},
            ),
          ),
          ReportsCard(
            icon: MyIcons.calendar,
            title: "هذا الشهر",
            suffixText: context.appLocalization.customize,
            onTapSuffix: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ReportsBubble(
                  title: context.appLocalization.totalTasks,
                  value: "119",
                  flex: 2,
                  backgroungColor: context.colorPalette.primary,
                  textColor: context.colorPalette.white,
                ),
                const SizedBox(width: 10),
                ReportsBubble(
                  title: context.appLocalization.completedTasks,
                  value: "99",
                  flex: 2,
                  backgroungColor: context.colorPalette.primary,
                  textColor: context.colorPalette.white,
                ),
                const SizedBox(width: 10),
                ReportsBubble(
                  title: context.appLocalization.overdueAndNotSubmittedTasks,
                  value: "12",
                  flex: 3,
                  backgroungColor: context.colorPalette.redC10,
                  textColor: context.colorPalette.white,
                ),
              ],
            ),
          ),
          Row(
            children: [
              ReportsBubble(
                title: context.appLocalization.tasksSubmittedLate,
                value: "15",
                flex: 4,
                backgroungColor: context.colorPalette.redFFC,
              ),
              const SizedBox(width: 10),
              ReportsBubble(
                title: context.appLocalization.totalDelayTime,
                value: "11:49:23",
                flex: 3,
                backgroungColor: context.colorPalette.redFFC,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ReportsBubble(
                  title: context.appLocalization.totalImprest,
                  value: "50,000",
                  isWallet: true,
                ),
                const SizedBox(width: 10),
                ReportsBubble(
                  title: context.appLocalization.expenses,
                  value: "50,000",
                  isWallet: true,
                ),
                const SizedBox(width: 10),
                ReportsBubble(
                  title: context.appLocalization.netImprest,
                  value: "50,000",
                  isWallet: true,
                ),
              ],
            ),
          ),
          Row(
            children: [
              ReportsBubble(
                title: context.appLocalization.orders,
                value: "56",
                flex: 2,
              ),
              const SizedBox(width: 10),
              ReportsBubble(
                title: context.appLocalization.disposalOperations,
                value: "13",
                flex: 4,
                backgroungColor: context.colorPalette.yellowFFE,
              ),
              const SizedBox(width: 10),
              ReportsBubble(
                title: context.appLocalization.humanResources,
                value: "8",
                flex: 3,
              ),
              const Expanded(flex: 3, child: SizedBox.shrink()),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ReportsBubble(
                title: context.appLocalization.outOfStockItems,
                value: "120",
              ),
              const SizedBox(width: 10),
              ReportsBubble(
                title: context.appLocalization.itemsNeedingRestock,
                value: "37",
              ),
              const SizedBox(width: 10),
              ReportsBubble(
                title: context.appLocalization.totalItems,
                value: "340",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
