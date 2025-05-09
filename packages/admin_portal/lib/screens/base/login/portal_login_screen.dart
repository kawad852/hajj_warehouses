import 'package:shared/shared.dart';

class PortalLoginScreen extends StatefulWidget {
  const PortalLoginScreen({super.key});

  @override
  State<PortalLoginScreen> createState() => _PortalLoginScreenState();
}

class _PortalLoginScreenState extends State<PortalLoginScreen> {
  late UserProvider _userProvider;
  late String? _email, _password;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userProvider = context.userProvider;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Card(
              margin: const EdgeInsets.all(30),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset(MyImages.logo, width: 150)),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 30),
                        child: Text(
                          context.appLocalization.adminLogin,
                          style: context.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      EmailEditor(
                        initialValue: null,
                        withErrorIndicator: false,
                        onChanged: (value) => _email = value,
                      ),
                      PasswordEditor(
                        initialValue: null,
                        withErrorIndicator: false,
                        onChanged: (value) => _password = value,
                      ),
                      FilledButton(
                        child: Text(context.appLocalization.login),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            // _userProvider.login(
                            //   context,
                            //   email: _email!,
                            //   password: _password!,
                            // );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
