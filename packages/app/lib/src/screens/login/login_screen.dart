import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email;
  String? _password;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      try {
        AppOverlayLoader.show();
        final auth = await _firebaseAuth.signInWithEmailAndPassword(
          email: _email!,
          password: _password!,
        );
        if (context.mounted) {
          await context.userProvider.login(context, auth);
        }
      } on FirebaseAuthException catch (e) {
        if (context.mounted) {
          if (e.code == 'user-not-found') {
            context.showSnackBar("context.appLocalization.emailNotFount");
          } else if (e.code == 'wrong-password') {
            context.showSnackBar("context.appLocalization.wrongPassword");
          } else {
            context.showSnackBar(context.appLocalization.generalError);
          }
        }
      } catch (e) {
        if (context.mounted) {
          context.showSnackBar(context.appLocalization.generalError);
        }
      } finally {
        AppOverlayLoader.hide();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
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
                      prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.user)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TitledTextField(
                    title: "كلمة المرور",
                    child: PasswordEditor(onChanged: (value) {}, initialValue: null),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "هل نسيت كلمة المرور ؟ ",
                        style: TextStyle(color: context.colorPalette.black, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "استعادة كلمة المرور",
                          style: TextStyle(color: context.colorPalette.grey708, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 90),
                  StretchedButton(
                    onPressed: () {
                      _login(context);
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
      ),
    );
  }
}
