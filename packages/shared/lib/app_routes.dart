import 'package:admin_portal/screens/base/admins/admins_table.dart';
import 'package:admin_portal/screens/base/app_nav_rail.dart';
import 'package:admin_portal/screens/base/companies/companies_table.dart';
import 'package:admin_portal/screens/base/login/portal_login_screen.dart';
import 'package:admin_portal/screens/base/messages/messages_table.dart';
import 'package:admin_portal/screens/base/no_access_screen.dart';
import 'package:admin_portal/screens/base/policies/policies_table.dart';
import 'package:admin_portal/screens/base/roles/roles_table.dart';
import 'package:admin_portal/screens/base/users/users_table.dart';
import 'package:shared/shared.dart';

part 'app_routes.g.dart';

// this is the commit where to get back to in case you want shellRoutes again

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final companiesRouteKey = GlobalKey<NavigatorState>();
final usersRouteKey = GlobalKey<NavigatorState>();
final adminsRouteKey = GlobalKey<NavigatorState>();
final rolesRouteKey = GlobalKey<NavigatorState>();
final policiesRouteKey = GlobalKey<NavigatorState>();
final messagesRouteKey = GlobalKey<NavigatorState>();

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
    ///Manage
    TypedStatefulShellBranch<CompaniesTableBranch>(
      routes: [TypedGoRoute<CompaniesTableRoute>(path: '/companies')],
    ),
    TypedStatefulShellBranch<UsersTableBranch>(
      routes: [TypedGoRoute<UsersTableRoute>(path: '/users')],
    ),
    TypedStatefulShellBranch<MessagesTableBranch>(
      routes: [TypedGoRoute<MessagesTableRoute>(path: '/admin-messages')],
    ),

    ///Config
    TypedStatefulShellBranch<AdminsTableBranch>(
      routes: [TypedGoRoute<AdminsTableRoute>(path: '/admins')],
    ),
    TypedStatefulShellBranch<RolesTableBranch>(
      routes: [TypedGoRoute<RolesTableRoute>(path: '/roles')],
    ),
    TypedStatefulShellBranch<PoliciesTableBranch>(
      routes: [TypedGoRoute<PoliciesTableRoute>(path: '/policies')],
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

///Manage ...

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

//messages
class MessagesTableBranch extends StatefulShellBranchData {
  const MessagesTableBranch();
  static final GlobalKey<NavigatorState> $navigatorKey = messagesRouteKey;
}

class MessagesTableRoute extends GoRouteData {
  @override
  build(BuildContext context, GoRouterState state) {
    return const MessagesTable();
  }
}

///....

///Config

//Admins
class AdminsTableBranch extends StatefulShellBranchData {
  const AdminsTableBranch();
  static final GlobalKey<NavigatorState> $navigatorKey = adminsRouteKey;
}

class AdminsTableRoute extends GoRouteData {
  @override
  build(BuildContext context, GoRouterState state) {
    return const AdminsTable();
  }
}

//roles
class RolesTableBranch extends StatefulShellBranchData {
  const RolesTableBranch();
  static final GlobalKey<NavigatorState> $navigatorKey = rolesRouteKey;
}

class RolesTableRoute extends GoRouteData {
  @override
  build(BuildContext context, GoRouterState state) {
    return const RolesTable();
  }
}

//policies
class PoliciesTableBranch extends StatefulShellBranchData {
  const PoliciesTableBranch();
  static final GlobalKey<NavigatorState> $navigatorKey = policiesRouteKey;
}

class PoliciesTableRoute extends GoRouteData {
  PoliciesTableRoute();

  @override
  build(BuildContext context, GoRouterState state) {
    return const PoliciesTable();
  }
}
