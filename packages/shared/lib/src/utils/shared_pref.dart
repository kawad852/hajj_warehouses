import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../enums/base_enums.dart';
import '../models/basket/basket_model.dart';
import '../models/user/user_model.dart';
import 'app_constants.dart';

class MySharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void clearStorage() {
    user = null;
  }

  static UserModel? get user {
    String? value = _sharedPreferences.getString('user');
    UserModel? userModel;
    if (value != null && value.isNotEmpty && value != 'null') {
      userModel = UserModel.fromJson(jsonDecode(value));
    }
    return userModel;
  }

  static set user(UserModel? value) {
    value?.createdAt = null;
    _sharedPreferences.setString('user', jsonEncode(value?.toJson()));
  }

  static List<BasketModel> get basket {
    var value = _sharedPreferences.getString('basket');
    List<BasketModel>? basket = [];
    if (value != null && value.isNotEmpty && value != 'null') {
      List<dynamic> result = jsonDecode(value);
      basket = result.toList().map((element) => BasketModel.fromJson(element)).toList();
      return basket;
    } else {
      return [];
    }
  }

  static set basket(List<BasketModel>? value) {
    if (value != null) {
      for (var element in value) {
        element.createdAt = null;
        element.product?.createdAt = null;
      }
    }
    _sharedPreferences.setString('basket', jsonEncode(value));
  }

  static bool get passedIntro => _sharedPreferences.getBool('passedIntro') ?? false;
  static set passedIntro(bool value) => _sharedPreferences.setBool('passedIntro', value);

  static String get language => _sharedPreferences.getString('language') ?? LanguageEnum.arabic;
  static set language(String value) => _sharedPreferences.setString('language', value);

  static String get theme => _sharedPreferences.getString('theme') ?? ThemeEnum.light;
  static set theme(String value) => _sharedPreferences.setString('theme', value);

  static String get countryCode =>
      _sharedPreferences.getString('countryCode') ?? kFallBackCountryCode;
  static set countryCode(String value) => _sharedPreferences.setString('countryCode', value);

  static String get selectedBranchId =>
      _sharedPreferences.getString('selectedBranchId') ?? kFallBackCountryCode;
  static set selectedBranchId(String value) =>
      _sharedPreferences.setString('selectedBranchId', value);
}
