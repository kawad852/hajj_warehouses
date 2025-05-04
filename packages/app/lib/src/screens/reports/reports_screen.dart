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
      appBar: AppBar(title: const AppBarText("التقارير")),
      bottomNavigationBar: BottomButton(text: "اضافة قسم جديد", onPressed: () {}),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          Text(
            "يمكنك تغيير فترة التقارير من خلال تحديد الفترة الزمنية",
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
              suffixText: "تغيير الفرع",
              onTapSuffix: () {},
            ),
          ),
          ReportsCard(
            icon: MyIcons.calendar,
            title: "هذا الشهر",
            suffixText: "تخصيص",
            onTapSuffix: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ReportsBubble(
                  title: "اجمالي المهام",
                  value: "119",
                  flex: 2,
                  backgroungColor: context.colorPalette.primary,
                  textColor: context.colorPalette.white,
                ),
                const SizedBox(width: 10),
                ReportsBubble(
                  title: "مهام مكتملة",
                  value: "99",
                  flex: 2,
                  backgroungColor: context.colorPalette.primary,
                  textColor: context.colorPalette.white,
                ),
                const SizedBox(width: 10),
                ReportsBubble(
                  title: "مهام متأخرة ولم تسلم",
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
                title: "مهام سلمت بوقت متأخر",
                value: "15",
                flex: 4,
                backgroungColor: context.colorPalette.redFFC,
              ),
              const SizedBox(width: 10),
              ReportsBubble(
                title: "اجمالي وقت التأخير",
                value: "11:49:23",
                flex: 3,
                backgroungColor: context.colorPalette.redFFC,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ReportsBubble(title: "اجمالي العهدة", value: "50,000", isWallet: true),
                SizedBox(width: 10),
                ReportsBubble(title: "المصروفات", value: "50,000", isWallet: true),
                SizedBox(width: 10),
                ReportsBubble(title: "صافي العهدة", value: "50,000", isWallet: true),
              ],
            ),
          ),
          Row(
            children: [
              const ReportsBubble(title: "الطلبات", value: "56", flex: 2),
              const SizedBox(width: 10),
              ReportsBubble(
                title: "عمليات الإتلاف",
                value: "13",
                flex: 4,
                backgroungColor: context.colorPalette.yellowFFE,
              ),
              const SizedBox(width: 10),
              const ReportsBubble(title: "الكادر البشري", value: "8", flex: 3),
              const Expanded(flex: 3, child: SizedBox.shrink()),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              ReportsBubble(title: "اصناف نفذت", value: "120"),
              SizedBox(width: 10),
              ReportsBubble(title: "اصناف تحتاج تزويد", value: "37"),
              SizedBox(width: 10),
              ReportsBubble(title: "اجمالي الأصناف", value: "340"),
            ],
          ),
        ],
      ),
    );
  }
}
