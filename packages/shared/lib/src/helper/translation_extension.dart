// import '../../object_box_exports.dart';
// import '../../shared.dart';

import '../../shared.dart';

extension LanguageExtension on BuildContext {
  AppLocalizations get appLocalization => AppLocalizations.of(this)!;

  String get languageCode => Localizations.localeOf(this).languageCode;

  bool get isRTL => Localizations.localeOf(this).languageCode == LanguageEnum.arabic;

  // static get localizationsDelegates => AppLocalizations.localizationsDelegates;
  // static get supportedLocales => AppLocalizations.supportedLocales;
}
