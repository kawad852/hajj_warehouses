class LanguageEnum {
  static const String english = 'en';
  static const String arabic = 'ar';
}

class ThemeEnum {
  static const String light = 'light';
  static const String dark = 'dark';
}

class AuthProviders {
  static const String google = 'google';
  static const String apple = 'apple';
  static const String phone = 'phone';
  static const String email = 'email';
}

enum ActionType { add, edit, delete }

enum RoleEnum {
  admin('ADMIN'),
  manager('MANAGER');

  final String value;

  const RoleEnum(this.value);
}

enum PolicyDocument {
  privacyPolicy('BklYRnbuGMi4r2Y7Qe3Y'),
  termsOfUse('9heum2QGHq0mNBnhbRs2'),
  aboutUs('qq28whc9BmBCHpeiWE3O');

  final String value;

  const PolicyDocument(this.value);
}

enum AuthEnum { app, companyAdmin, admin }
