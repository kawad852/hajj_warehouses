import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:shared/object_box_exports.dart';
import 'package:shared/shared.dart';

import '../../../../shared.dart';

class FullCalendarBuilder extends StatefulWidget {
  final Function(DateTime date) onChanged;

  const FullCalendarBuilder({super.key, required this.onChanged});

  @override
  State<FullCalendarBuilder> createState() => _FullCalendarBuilderState();
}

class _FullCalendarBuilderState extends State<FullCalendarBuilder> {
  late DateTime _selectedDate;

  List<DateTime> get _days {
    final firstDay = DateTime(_selectedDate.year, _selectedDate.month, 1);
    final lastDay = DateTime(_selectedDate.year, _selectedDate.month + 1, 0); // last day of month

    List<DateTime> days = [];
    for (int i = 0; i < lastDay.day; i++) {
      days.add(DateTime(_selectedDate.year, _selectedDate.month, i + 1));
    }

    return days;
  }

  void _showDateTimePicker(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      dateFormat: 'MMMM yyyy',
      initialDateTime: _selectedDate,
      minDateTime: kNowDate,
      maxDateTime: kNowDate.add(const Duration(days: 999)),
      locale: context.isRTL ? DateTimePickerLocale.ar_eg : DateTimePickerLocale.en_us,
      onMonthChangeStartWithFirstDate: true,
      onConfirm: (date, list) {
        setState(() {
          _selectedDate = date.copyWith(day: 1);
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = kNowDate;
  }

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10),
            child: InkWell(
              onTap: () {
                _showDateTimePicker(context);
              },
              borderRadius: BorderRadius.circular(10),
              child: Ink(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 5, end: 10),
                      child: Text(
                        DateFormat.yMMM(context.languageCode).format(_selectedDate),
                        style: TextStyle(
                          color: context.colorPalette.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 69,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 5),
            itemCount: _days.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsetsDirectional.only(start: 15, top: 10, bottom: 7, end: 15),
            itemBuilder: (context, index) {
              final date = _days[index];
              return CalenderCard(
                onTap: () {
                  setState(() {
                    _selectedDate = date;
                  });
                  widget.onChanged(_selectedDate);
                },
                selected: _selectedDate.day == date.day,
                date: date,
              );
            },
          ),
        ),
      ],
    );
  }
}
