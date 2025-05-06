import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:shared/shared.dart';

import '../../../object_box_exports.dart';

class DatePickerEditor extends StatefulWidget {
  final DateTime? value;
  final Function(DateTime value) onChanged;
  final bool required;
  final String? labelText;
  final DateTime? minDateTime;
  final DateTime? maxDateTime;
  final bool includeTime;
  final TextStyle? style;

  const DatePickerEditor({
    super.key,
    required this.value,
    required this.onChanged,
    this.required = true,
    this.labelText,
    this.minDateTime,
    this.maxDateTime,
    this.includeTime = false,
    this.style,
  });

  @override
  State<DatePickerEditor> createState() => _DatePickerEditorState();
}

class _DatePickerEditorState extends State<DatePickerEditor> {
  late DateTime? _value;

  // Future<void> _showDatePicker(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: _value,
  //     firstDate: widget.fistDate ?? DateTime.now(),
  //     lastDate: widget.lastDate ?? DateTime(2050, 8),
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       _value = picked;
  //     });
  //     widget.onChanged(_value);
  //   }
  // }

  void _showDateTimePicker(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      dateFormat: widget.includeTime ? 'dd MMMM yyyy HH:mm' : 'dd MMMM yyyy',
      initialDateTime: _value ?? (widget.minDateTime ?? kNowDate),
      minDateTime: widget.minDateTime ?? kNowDate,
      maxDateTime: widget.maxDateTime ?? kNowDate.add(const Duration(days: 999)),
      locale: context.isRTL ? DateTimePickerLocale.ar_eg : DateTimePickerLocale.en_us,
      onMonthChangeStartWithFirstDate: true,
      onConfirm: (date, list) {
        setState(() {
          _value = date;
        });
        widget.onChanged(_value!);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _value = widget.value;
    print("widget.maxDateTime::: ${widget.maxDateTime}");
  }

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMMMd(context.languageCode);
    if (widget.includeTime) {
      date.add_jm();
    }
    return NavEditor(
      value: _value != null ? date.format(_value!) : null,
      labelText: widget.labelText,
      required: widget.required,
      style: widget.style,
      onTap: () {
        // _showDatePicker(context);
        _showDateTimePicker(context);
      },
      validator: widget.required ? (value) => ValidationHelper.general(context, value) : null,
      suffixIcon: const Center(child: CustomSvg(MyIcons.calendar, width: 18)),
    );
  }
}
