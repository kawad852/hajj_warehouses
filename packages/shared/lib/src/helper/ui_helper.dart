import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../enums/base_enums.dart';
import '../enums/stores_enums.dart';

class UiHelper {
  static String translate({
    required String? textEN,
    required String? textAR,
    String? textUr,
    String? textFr,
    String? textTr,
    String? textFa,
  }) {
    const language = 'en';
    switch (language) {
      case LanguageEnum.arabic:
        return textAR ?? '';
      default:
        return textEN ?? '';
    }
  }

  static IconData getBuildingIcon(String value) {
    final type = BuildingType.values.firstWhere((e) => e.value == value);
    switch (type) {
      case BuildingType.apartment:
        return FontAwesomeIcons.apartment;
      case BuildingType.office:
        return FontAwesomeIcons.chairOffice;
      default:
        return FontAwesomeIcons.house;
    }
  }
}
