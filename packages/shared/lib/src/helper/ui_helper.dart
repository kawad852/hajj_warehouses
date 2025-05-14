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
    switch (value) {
      case RoleEnum.admin:
        return context.appLocalization.admin;
      case RoleEnum.manager:
        return context.appLocalization.manager;
      case RoleEnum.employee:
        return context.appLocalization.employee;
    }
  }
}
