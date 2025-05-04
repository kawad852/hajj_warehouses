import 'package:app/shared.dart';
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
        ProfileCard(
          title: "الإدارة",
          icon: MyIcons.setting,
          onTap: () {
            context.push((context) => const SettingsScreen());
          },
        ),
        ProfileCard(title: "المساعد الذكي", icon: MyIcons.helper, onTap: () {}),
        ProfileCard(title: "تغيير اللغة", icon: MyIcons.language, onTap: () {}),
        ProfileCard(
          title: "تسجيل الخروج",
          icon: MyIcons.logout,
          onTap: () {
            context.userProvider.logout(context);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            "عن التطبيق",
            style: TextStyle(
              color: context.colorPalette.black,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        // ProfileCard(
        //   title: "الشروط والأحكام",
        //   icon: MyIcons.terms,
        //   onTap: () {
        //     context.push((context) {
        //       return PolicyScreen(id: PolicyDocuments.termsOfUse.value);
        //     });
        //   },
        // ),
        ProfileCard(
          title: "سياسة الخصوصية",
          icon: MyIcons.policy,
          onTap: () {
            context.push((context) {
              return PolicyScreen(id: PolicyDocuments.privacyPolicy.value);
            });
          },
        ),
        // ProfileCard(
        //   title: "عن مخازن الحج",
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
