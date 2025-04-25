import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppBarText("الإدارة")),
      bottomNavigationBar: BottomButton(
        text: "اضافة قسم جديد",
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            ProfileCard(
              title: "ادارة الفروع",
              icon: MyIcons.setting,
              onTap: () {},
            ),
            ProfileCard(
              title: "إدارة الموظفين الإداريين",
              icon: MyIcons.helper,
              onTap: () {},
            ),
            ProfileCard(
              title: "ارسال الإشعارات وتنبيهات",
              icon: MyIcons.helper,
              onTap: () {},
            ),
            ProfileCard(
              title: "رسائل إدارية",
              icon: MyIcons.helper,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
