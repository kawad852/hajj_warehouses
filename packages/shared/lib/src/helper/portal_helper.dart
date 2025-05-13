import 'package:shared/app_routes.dart';
import 'package:shared/shared.dart';

class PortalHelper {
  static String getFlag(String code) => 'assets/flags/${code.toLowerCase()}.svg';

  static List<String> get railPaths =>
      $appNavBarRoute.routes.map((e) => e as GoRoute).map((e) => e.path).toList();

  static String getPathLabel(BuildContext context, String path) {
    if (path == UsersTableRoute().location) {
      return context.appLocalization.users;
    } else if (path == AdminsTableRoute().location) {
      return context.appLocalization.admins;
    } else if (path == CompaniesTableRoute().location) {
      return context.appLocalization.companies;
    } else if (path == RolesTableRoute().location) {
      return context.appLocalization.roles;
    } else if (path == PoliciesTableRoute().location) {
      return context.appLocalization.policies;
    } else {
      throw 'PATH NEEDS TO BE ADDED';
    }
  }
}
