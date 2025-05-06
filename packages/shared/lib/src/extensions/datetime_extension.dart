import 'package:shared/shared.dart';

import '../../object_box_exports.dart';

extension DatetimeExtension on DateTime {
  String getTime(BuildContext context) => DateFormat.jm(context.languageCode).format(this);
  String getDefaultFormattedDate(BuildContext context) =>
      DateFormat.yMd(context.languageCode).format(this);
}
