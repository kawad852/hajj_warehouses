import 'package:shared/shared.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  String? _email;
  final _formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      ApiService.fetch(
        context,
        callBack: () async {
          await FirebaseAuth.instance.sendPasswordResetEmail(email: _email!);
          if (context.mounted) {
            Navigator.pop(context);
            context.showSnackBar(context.appLocalization.checkEmailResetPasswordMsg);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomButton(
        text: context.appLocalization.resetPassword,
        onPressed: () {
          _onSubmit(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: context.mediaQuery.width),
              Text(
                context.appLocalization.lostYourPassword,
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                context.appLocalization.youCanRecoverIt,
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  context.appLocalization.enterEmailToRecoverPass,
                  style: TextStyle(
                    color: context.colorPalette.grey666,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              EmailEditor(initialValue: null, onChanged: (value) => _email = value),
            ],
          ),
        ),
      ),
    );
  }
}
