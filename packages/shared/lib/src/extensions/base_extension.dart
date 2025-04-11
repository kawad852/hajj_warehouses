import 'package:flutter/material.dart';
import 'package:shared/src/helper/translation_extension.dart';

import '../providers/app_provider.dart';

extension BaseExtensions on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  void unFocusKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
  String get currency => isRTL ? 'د.أ' : 'JD';
  String? get countryCode => AppProvider.countryCode;
}
