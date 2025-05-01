import 'package:shared/shared.dart';

class ExpenseModel {
  final String id;
  final String nameAr;
  final String nameEn;

  ExpenseModel(this.id, this.nameAr, this.nameEn);

  String get name {
    return UiHelper.translate(textEN: nameEn, textAR: nameAr);
  }
}
