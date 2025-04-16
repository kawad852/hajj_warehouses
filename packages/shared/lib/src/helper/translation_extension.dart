import 'package:flutter/material.dart';

import '../../shared.dart';
// import 'package:shared/src/l10n/app_localizations.dart';

extension LanguageExtension on BuildContext {
  AppLocalizations get appLocalization => AppLocalizations.of(this)!;

  String get languageCode => Localizations.localeOf(this).languageCode;

  bool get isRTL => Localizations.localeOf(this).languageCode == LanguageEnum.arabic;
}
