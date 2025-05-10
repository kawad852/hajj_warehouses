import 'package:shared/app_routes.dart';
import 'package:shared/shared.dart';

class PortalHelper {
  static String getFlag(String code) => 'assets/flags/${code.toLowerCase()}.svg';

  static List<String> get railPaths =>
      $appNavBarRoute.routes.map((e) => e as GoRoute).map((e) => e.path).toList();

  static String getPathLabel(BuildContext context, String path) {
    if (path == UsersTableRoute().location) {
      return context.appLocalization.users;
    } else {
      throw 'PATH NEEDS TO BE ADDED';
    }
  }
}
