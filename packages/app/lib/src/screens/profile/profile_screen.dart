import 'package:app/shared.dart';
import 'package:app/src/screens/chatbot/chatbot_screen.dart';
import 'package:app/src/screens/policy/policy_screen.dart';
import 'package:shared/shared.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      children: [
        // ProfileCard(
        //   title: context.appLocalization.management,
        //   icon: MyIcons.setting,
        //   onTap: () {
        //     context.push((context) => const SettingsScreen());
        //   },
        // ),
        ProfileCard(
          title: context.appLocalization.smartAssistant,
          icon: MyIcons.helper,
          onTap: () {
            context.push((context) {
              return const ChatbotScreen();
            });
          },
        ),
        // ProfileCard(title: context.appLocalization.changeLanguage, icon: MyIcons.language, onTap: () {}),
        ProfileCard(
          title: context.appLocalization.logOut,
          icon: MyIcons.logout,
          onTap: () {
            context.userProvider.logout(context);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            context.appLocalization.aboutTheApp,
            style: TextStyle(
              color: context.colorPalette.black,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        // ProfileCard(
        //   title: context.appLocalization.termsOfUse,
        //   icon: MyIcons.terms,
        //   onTap: () {
        //     context.push((context) {
        //       return PolicyScreen(id: PolicyDocuments.termsOfUse.value);
        //     });
        //   },
        // ),
        ProfileCard(
          title: context.appLocalization.privacyPolicy,
          icon: MyIcons.policy,
          onTap: () {
            context.push((context) {
              return PolicyScreen(id: PolicyDocument.privacyPolicy.value);
            });
          },
        ),
        // ProfileCard(
        //   title: context.appLocalization.aboutHajjWarehouses,
        //   icon: MyIcons.information,
        //   onTap: () {
        //     context.push((context) {
        //       return PolicyScreen(id: PolicyDocuments.aboutUs.value);
        //     });
        //   },
        // ),
      ],
    );
  }
}
