import 'package:shared/shared.dart';

class BranchInputScreen extends StatefulWidget {
  const BranchInputScreen({super.key});

  @override
  State<BranchInputScreen> createState() => _BranchInputScreenState();
}

class _BranchInputScreenState extends State<BranchInputScreen> {
  final _formKey = GlobalKey<FormState>();
  late BranchModel _branch;

  void _onAdd(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      ApiService.fetch(
        context,
        callBack: () async {
          final docRef = kFirebaseInstant.branches.doc();
          _branch.id = docRef.id;
          _branch.createdAt = kNowDate;
          await docRef.set(_branch);
          if (context.mounted) {
            Fluttertoast.showToast(msg: context.appLocalization.addedSuccessfully);
            Navigator.pop(context);
          }
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _branch = BranchModel(companyId: kCompanyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إضافة فرع")),
      bottomNavigationBar: BottomButton(
        text: context.appLocalization.add,
        onPressed: () {
          _onAdd(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TitledTextField(
                title: context.appLocalization.name,
                child: TextEditor(
                  onChanged: (value) {
                    _branch.name = value!;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
