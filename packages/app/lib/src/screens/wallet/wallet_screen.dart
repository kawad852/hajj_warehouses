import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
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
                    "43,590",
                    style: TextStyle(
                      color: context.colorPalette.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10),
                  CustomSvg(
                    MyIcons.currency,
                    color: context.colorPalette.white,
                    width: 30,
                  ),
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
      body: ListView(
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
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return const WalletOperation();
            },
          ),
        ],
      ),
    );
  }
}
