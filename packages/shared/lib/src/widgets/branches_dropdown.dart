import 'package:shared/shared.dart';

class BranchesDropdown extends StatelessWidget {
  final List<BranchModel> branches;
  final String title;
  final String? value;
  final Function(String? id)? onChanged;

  const BranchesDropdown({
    super.key,
    required this.branches,
    required this.title,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return TitledTextField(
      title: title,
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
      child: DropDownEditor(
        value: value,
        items:
            branches.map((e) {
              return DropdownMenuItem(value: e.id, child: Text(e.name));
            }).toList(),
        onChanged: onChanged,
        title: "اختر الفرع",
      ),
    );
  }
}
