import 'package:shared/shared.dart';

extension StatusExtensions on String {
  String get itemStatusLabel {
    if (this == ItemStatusEnum.outOfStock.value) {
      return "غير متوفر";
    } else if (this == ItemStatusEnum.lowStock.value) {
      return "بحاحة";
    } else {
      return "متوفر";
    }
  }
}
