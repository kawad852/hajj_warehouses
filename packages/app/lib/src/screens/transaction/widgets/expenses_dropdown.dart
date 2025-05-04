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
    return TitledTextField(
      title: "نوع المصروف",
      textStyle: TextStyle(
        color: context.colorPalette.black001,
        fontSize: 14,
        fontWeight: FontWeight.w800,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: context.colorPalette.primary),
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: DropDownEditor(
          value: _value,
          items:
              expenses.map((e) {
                final id = e.id;
                final name = e.name;
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
