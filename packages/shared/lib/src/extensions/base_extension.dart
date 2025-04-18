import 'package:shared/shared.dart';

extension BaseExtensions on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorPalette get colorPalette => ColorPalette.of(this);
  Size get mediaQuery => MediaQuery.sizeOf(this);

  void unFocusKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
  String get currency => isRTL ? 'د.أ' : 'JD';
  String? get countryCode => AppProvider.countryCode;
}
