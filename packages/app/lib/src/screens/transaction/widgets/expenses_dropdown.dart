import 'package:shared/shared.dart';

class ExpensesDropdown extends StatefulWidget {
  final String? value;
  final Function(String value) onChanged;

  const ExpensesDropdown({super.key, required this.value, required this.onChanged});

  @override
  State<ExpensesDropdown> createState() => _ExpensesDropdownState();
}

class _ExpensesDropdownState extends State<ExpensesDropdown> {
  String? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> expenses = [
      {"id": "1", "name": "إيجار معدات"},
      {"id": "2", "name": "كهرباء"},
      {"id": "3", "name": "مصاريف نقل"},
      {"id": "4", "name": "مصاريف موظفين"},
      {"id": "5", "name": "مصاريف صيانة"},
    ];
    return TitledTextField(
      title: "نوع المصروف",
      textStyle: TextStyle(
        color: context.colorPalette.black001,
        fontSize: 14,
        fontWeight: FontWeight.w800,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: context.colorPalette.grey708),
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: DropDownEditor(
          value: _value,
          items:
              expenses.map((e) {
                final id = e['id'] as String;
                final name = e['name'] as String;
                return DropdownMenuItem(value: id, child: Text(name));
              }).toList(),
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            widget.onChanged(value!);
          },
          title: "",
        ),
      ),
    );
  }
}
