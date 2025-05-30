import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _username;
  var _password = '';
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      await context.userProvider.login(
        context,
        username: _username!,
        password: _password,
        authEnum: AuthEnum.app,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomButton(
        text: context.appLocalization.login,
        onPressed: () {
          _login(context);
        },
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: context.mediaQuery.width, height: 100),
            const CustomSvg(MyIcons.logo),
            const SizedBox(height: 30),
            Text(
              context.appLocalization.managingHajjOperations,
              style: TextStyle(
                color: context.colorPalette.black,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              context.appLocalization.simply,
              style: TextStyle(
                color: context.colorPalette.primary,
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
                    title: context.appLocalization.userName,
                    child: UsernameEditor(onChanged: (value) => _username = value),
                  ),
                  const SizedBox(height: 10),
                  TitledTextField(
                    title: context.appLocalization.password,
                    child: PasswordEditor(
                      onChanged: (value) => _password = value!,
                      initialValue: null,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.appLocalization.forgotPassword,
                        style: TextStyle(color: context.colorPalette.black, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          context.navigate((context) => const ResetPasswordScreen());
                        },
                        child: Text(
                          context.appLocalization.resetPassword,
                          style: TextStyle(color: context.colorPalette.primary, fontSize: 14),
                        ),
                      ),
                    ],
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
