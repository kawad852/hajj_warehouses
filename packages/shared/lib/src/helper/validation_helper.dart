import 'package:shared/shared.dart';

class ValidationHelper {
  static final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final decimalNumbersRegex = RegExp(r'^\d*\.?\d*$');
  static final intNumberRegex = RegExp(r'^\d+$');

  static String? general(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.appLocalization.requiredField;
    }
    return null;
  }

  //
  static String? email(BuildContext context, String? value) {
    if (value!.isEmpty) {
      return context.appLocalization.requiredField;
    } else if (!emailRegex.hasMatch(value)) {
      return context.appLocalization.invalidEmail;
    }
    return null;
  }

  //
  static String? numbers(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.appLocalization.requiredField;
    } else if (!decimalNumbersRegex.hasMatch(value)) {
      return context.appLocalization.invalidNumber;
    }
    return null;
  }

  //
  static String? numberInt(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.appLocalization.requiredField;
    } else if (!intNumberRegex.hasMatch(value)) {
      return context.appLocalization.invalidNumber;
    }
    return null;
  }

  static String? password(BuildContext context, String? value) {
    if (value!.isEmpty) {
      return context.appLocalization.requiredField;
    } else if (value.length < 6) {
      return context.appLocalization.passwordTooShort;
    } //context.appLocalization.passwordTooShort
    return null;
  }
}
