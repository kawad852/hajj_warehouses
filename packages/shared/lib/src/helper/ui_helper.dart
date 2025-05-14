import 'package:shared/shared.dart';

class UiHelper {
  static String translate({
    required String? textEN,
    required String? textAR,
    String? textUr,
    String? textFr,
    String? textTr,
    String? textFa,
  }) {
    final language = MySharedPreferences.language;
    switch (language) {
      case LanguageEnum.arabic:
        return textAR ?? '';
      default:
        return textEN ?? '';
    }
  }

  static String getRoleLabel(BuildContext context, RoleEnum value) {
    // final role = RoleEnum.values.firstWhere((e) => e.value == value);
    switch (value) {
      case RoleEnum.admin:
        return "Admin";
      case RoleEnum.manager:
        return "Manager";
      case RoleEnum.employee:
        return "Employee";
    }
  }
}
