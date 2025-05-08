import 'package:shared/shared.dart';

class CategoryInputScreen extends StatefulWidget {
  const CategoryInputScreen({super.key});

  @override
  State<CategoryInputScreen> createState() => _CategoryInputScreenState();
}

class _CategoryInputScreenState extends State<CategoryInputScreen> {
  late CategoryModel _category;
  final _formKey = GlobalKey<FormState>();

  void _onAdd(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      ApiService.fetch(
        context,
        callBack: () async {
          final ref = kFirebaseInstant.categories.doc();
          final id = ref.id;
          _category.id = id;
          _category.createdAt = kNowDate;
          await ref.set(_category);
          if (context.mounted) {
            context.showSnackBar(context.appLocalization.addedSuccessfully);
            Navigator.pop(context);
          }
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _category = CategoryModel(branchId: kSelectedBranchId, user: kCurrentLightUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(context.appLocalization.addSection)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextEditor(onChanged: (value) => _category.name = value!, hintText: context.appLocalization.itemName),
              StretchedButton(
                margin: const EdgeInsets.only(top: 30),
                onPressed: () {
                  _onAdd(context);
                },
                child: Text(context.appLocalization.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
