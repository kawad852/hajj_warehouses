import 'package:jhijri/_src/_jHijri.dart';
import 'package:shared/shared.dart';

import '../../object_box_exports.dart';

extension DatetimeExtension on DateTime {
  String get defaultDateFormat => hijri(this);

  String getTime(BuildContext context) => DateFormat.jm().format(this);

  String getDefaultFormattedDate(BuildContext context) =>
  // DateFormat.yMd().format(this);
  hijri(this);

  String getDateTimeFormatEN(BuildContext context) => DateFormat.yMd().add_jm().format(this);

  String hijri(DateTime date) {
    return JHijri(fDate: date).fullDate;
  }
}
