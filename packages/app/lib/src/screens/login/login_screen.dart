import 'package:app/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: context.mediaQuery.width, height: 100),
          const CustomSvg(MyIcons.logo),
          const SizedBox(height: 30),
          Text(
            "إدارة العمليات في مخازن الحج",
            style: TextStyle(
              color: context.colorPalette.black,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "ببساطة",
            style: TextStyle(
              color: context.colorPalette.grey708,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                TitledTextField(
                  title: "اسم المستخدم",
                  child: TextEditor(
                    onChanged: (value) {},
                    prefixIcon: const IconButton(
                      onPressed: null,
                      icon: CustomSvg(MyIcons.user),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TitledTextField(
                  title: "كلمة المرور",
                  child: PasswordEditor(
                    onChanged: (value) {},
                    initialValue: null,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "هل نسيت كلمة المرور ؟ ",
                      style: TextStyle(
                        color: context.colorPalette.black,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "استعادة كلمة المرور",
                        style: TextStyle(
                          color: context.colorPalette.grey708,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 90),
                StretchedButton(
                  onPressed: () {
                    context.push((context) => const ChooseBranchScreen());
                  },
                  child: Text(
                    "تسجيل الدخول",
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
        ],
      ),
    );
  }
}
