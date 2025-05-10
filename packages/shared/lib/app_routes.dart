import 'package:admin_portal/screens/base/app_nav_rail.dart';
import 'package:admin_portal/screens/base/companies/companies_table.dart';
import 'package:admin_portal/screens/base/login/portal_login_screen.dart';
import 'package:admin_portal/screens/base/no_access_screen.dart';
import 'package:admin_portal/screens/base/users/staff_table.dart';
import 'package:shared/shared.dart';

part 'app_routes.g.dart';

// this is the commit where to get back to in case you want shellRoutes again

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final usersRouteKey = GlobalKey<NavigatorState>();
final companiesRouteKey = GlobalKey<NavigatorState>();

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
    TypedStatefulShellBranch<StaffTableBranch>(
      routes: [TypedGoRoute<StaffTableRoute>(path: '/staff')],
    ),
    TypedStatefulShellBranch<CompaniesTableBranch>(
      routes: [TypedGoRoute<CompaniesTableRoute>(path: '/companies')],
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

//companies
class CompaniesTableBranch extends StatefulShellBranchData {
  const CompaniesTableBranch();
  static final GlobalKey<NavigatorState> $navigatorKey = companiesRouteKey;
}

class CompaniesTableRoute extends GoRouteData {
  @override
  build(BuildContext context, GoRouterState state) {
    return const CompaniesTable();
  }
}

//users
class StaffTableBranch extends StatefulShellBranchData {
  const StaffTableBranch();
  static final GlobalKey<NavigatorState> $navigatorKey = usersRouteKey;
}

class StaffTableRoute extends GoRouteData {
  @override
  build(BuildContext context, GoRouterState state) {
    return const StaffTable();
  }
}
