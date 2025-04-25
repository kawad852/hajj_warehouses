import 'package:shared/shared.dart';

class CategoryInputScreen extends StatefulWidget {
  const CategoryInputScreen({super.key});

  @override
  State<CategoryInputScreen> createState() => _CategoryInputScreenState();
}

class _CategoryInputScreenState extends State<CategoryInputScreen> {
  late CategoryModel _category;

  void _onAdd(BuildContext context) {
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

  @override
  void initState() {
    super.initState();
    _category = CategoryModel(branchId: kSelectedBranchId, user: kCurrentLightUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إضافة قسم")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextEditor(onChanged: (value) => _category.name = value!, hintText: "إسم الصنف"),
            StretchedButton(
              margin: const EdgeInsets.only(top: 30),
              onPressed: () {
                _onAdd(context);
              },
              child: const Text("إضافة"),
            ),
          ],
        ),
      ),
    );
  }
}
