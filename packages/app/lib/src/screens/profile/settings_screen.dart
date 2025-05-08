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
      appBar: AppBar(title:AppBarText(context.appLocalization.management)),
      bottomNavigationBar: BottomButton(
        text: context.appLocalization.addNewSection,
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            ProfileCard(
              title: context.appLocalization.branchManagement,
              icon: MyIcons.setting,
              onTap: () {},
            ),
            ProfileCard(
              title: context.appLocalization.managementOfAdministrativeStaff,
              icon: MyIcons.helper,
              onTap: () {},
            ),
            ProfileCard(
              title: context.appLocalization.sendingNotificationsAndAlerts,
              icon: MyIcons.helper,
              onTap: () {},
            ),
            ProfileCard(
              title: context.appLocalization.administrativeMessages,
              icon: MyIcons.helper,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
