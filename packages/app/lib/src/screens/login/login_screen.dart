import 'package:shared/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email;
  var _password = '';
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      try {
        AppOverlayLoader.show();
        final auth = await _firebaseAuth.signInWithEmailAndPassword(
          email: _email!,
          password: _password,
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
          } else if (e.code == 'invalid-credential') {
            context.showSnackBar("context.appLocalization.invalidCredintial");
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
                    child: TextEditor(
                      onChanged: (value) => _email = value,
                      prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.user)),
                    ),
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
                        onPressed: () {},
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
