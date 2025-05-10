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
      navigatorKey: StaffTableBranch.$navigatorKey,

      routes: [
        GoRouteData.$route(
          path: '/staff',

          factory: $StaffTableRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: CompaniesTableBranch.$navigatorKey,

      routes: [
        GoRouteData.$route(
          path: '/companies',

          factory: $CompaniesTableRouteExtension._fromState,
        ),
      ],
    ),
  ],
);

extension $AppNavBarRouteExtension on AppNavBarRoute {
  static AppNavBarRoute _fromState(GoRouterState state) =>
      const AppNavBarRoute();
}

extension $StaffTableRouteExtension on StaffTableRoute {
  static StaffTableRoute _fromState(GoRouterState state) => StaffTableRoute();

  String get location => GoRouteData.$location('/staff');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
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
