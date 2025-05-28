// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $loginRoute,
  $noAccessRoute,
  $appNavBarRoute,
];

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',

  factory: $LoginRouteExtension._fromState,
);

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  String get location => GoRouteData.$location('/login');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $noAccessRoute => GoRouteData.$route(
  path: '/no-access',

  factory: $NoAccessRouteExtension._fromState,
);

extension $NoAccessRouteExtension on NoAccessRoute {
  static NoAccessRoute _fromState(GoRouterState state) => NoAccessRoute();

  String get location => GoRouteData.$location('/no-access');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $appNavBarRoute => StatefulShellRouteData.$route(
  factory: $AppNavBarRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      navigatorKey: CompaniesTableBranch.$navigatorKey,

      routes: [
        GoRouteData.$route(
          path: '/companies',

          factory: $CompaniesTableRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: UsersTableBranch.$navigatorKey,

      routes: [
        GoRouteData.$route(
          path: '/users',

          factory: $UsersTableRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: MessagesTableBranch.$navigatorKey,

      routes: [
        GoRouteData.$route(
          path: '/admin-messages',

          factory: $MessagesTableRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: AdminsTableBranch.$navigatorKey,

      routes: [
        GoRouteData.$route(
          path: '/admins',

          factory: $AdminsTableRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: RolesTableBranch.$navigatorKey,

      routes: [
        GoRouteData.$route(
          path: '/roles',

          factory: $RolesTableRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: PoliciesTableBranch.$navigatorKey,

      routes: [
        GoRouteData.$route(
          path: '/policies',

          factory: $PoliciesTableRouteExtension._fromState,
        ),
      ],
    ),
  ],
);

extension $AppNavBarRouteExtension on AppNavBarRoute {
  static AppNavBarRoute _fromState(GoRouterState state) =>
      const AppNavBarRoute();
}

extension $CompaniesTableRouteExtension on CompaniesTableRoute {
  static CompaniesTableRoute _fromState(GoRouterState state) =>
      CompaniesTableRoute();

  String get location => GoRouteData.$location('/companies');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UsersTableRouteExtension on UsersTableRoute {
  static UsersTableRoute _fromState(GoRouterState state) => UsersTableRoute();

  String get location => GoRouteData.$location('/users');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MessagesTableRouteExtension on MessagesTableRoute {
  static MessagesTableRoute _fromState(GoRouterState state) =>
      MessagesTableRoute();

  String get location => GoRouteData.$location('/admin-messages');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AdminsTableRouteExtension on AdminsTableRoute {
  static AdminsTableRoute _fromState(GoRouterState state) => AdminsTableRoute();

  String get location => GoRouteData.$location('/admins');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RolesTableRouteExtension on RolesTableRoute {
  static RolesTableRoute _fromState(GoRouterState state) => RolesTableRoute();

  String get location => GoRouteData.$location('/roles');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PoliciesTableRouteExtension on PoliciesTableRoute {
  static PoliciesTableRoute _fromState(GoRouterState state) =>
      PoliciesTableRoute();

  String get location => GoRouteData.$location('/policies');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
