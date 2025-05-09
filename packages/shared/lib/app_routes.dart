import 'package:admin_portal/screens/base/app_nav_rail.dart';
import 'package:admin_portal/screens/base/login/portal_login_screen.dart';
import 'package:admin_portal/screens/base/no_access_screen.dart';
import 'package:admin_portal/screens/base/users/users_table.dart';
import 'package:shared/shared.dart';

part 'app_routes.g.dart';

// this is the commit where to get back to in case you want shellRoutes again

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final usersRouteKey = GlobalKey<NavigatorState>();

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  @override
  build(BuildContext context, GoRouterState state) {
    return const PortalLoginScreen();
  }
}

@TypedGoRoute<NoAccessRoute>(path: '/no-access')
class NoAccessRoute extends GoRouteData {
  @override
  build(BuildContext context, GoRouterState state) {
    return const NoAccessScreen();
  }
}

/// AppNavBar
@TypedStatefulShellRoute<AppNavBarRoute>(
  branches: [
    ///configure
    TypedStatefulShellBranch<UsersTableBranch>(
      routes: [TypedGoRoute<UsersTableRoute>(path: '/users')],
    ),
  ],
)
class AppNavBarRoute extends StatefulShellRouteData {
  const AppNavBarRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  builder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
    return AppNavRail(navigationShell: navigationShell);
  }
}

/// Configure

//users
class UsersTableBranch extends StatefulShellBranchData {
  const UsersTableBranch();
  static final GlobalKey<NavigatorState> $navigatorKey = usersRouteKey;
}

class UsersTableRoute extends GoRouteData {
  @override
  build(BuildContext context, GoRouterState state) {
    return const UsersTable();
  }
}
