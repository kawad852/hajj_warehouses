import 'package:shared/shared.dart';

import '../../../object_box_exports.dart';
import 'nav_editor.dart';

class DatePickerEditor extends StatefulWidget {
  final DateTime value;
  final Function(DateTime value) onChanged;
  final bool required;
  final String? labelText;
  final DateTime? fistDate;
  final DateTime? lastDate;

  const DatePickerEditor({
    super.key,
    required this.value,
    required this.onChanged,
    this.required = true,
    this.labelText,
    this.fistDate,
    this.lastDate,
  });

  @override
  State<DatePickerEditor> createState() => _DatePickerEditorState();
}

class _DatePickerEditorState extends State<DatePickerEditor> {
  late DateTime _value;

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _value,
      firstDate: widget.fistDate ?? DateTime.now(),
      lastDate: widget.lastDate ?? DateTime(2050, 8),
    );
    if (picked != null) {
      setState(() {
        _value = picked;
      });
      widget.onChanged(_value);
    }
  }

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return NavEditor(
      value: DateFormat.yMMMd(context.languageCode).format(_value),
      labelText: widget.labelText,
      required: widget.required,
      onTap: () {
        _showDatePicker(context);
      },
      validator: widget.required ? (value) => ValidationHelper.general(context, value) : null,
      suffixIcon: const Center(child: CustomSvg(MyIcons.calendar, width: 18)),
    );
  }
}
