import 'package:shared/shared.dart';

import 'drawer/app_drawer.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class AppNavRail extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const AppNavRail({super.key, required this.navigationShell});

  @override
  State<AppNavRail> createState() => _AppNavRailState();
}

class _AppNavRailState extends State<AppNavRail> {
  late PortalProvider _portalProvider;

  List<String> _getRouteSections(int start, int end) {
    final routes = PortalHelper.railPaths.getRange(start, end).toList();
    return routes;
  }

  @override
  void initState() {
    super.initState();
    _portalProvider = context.portalProvider;
    _portalProvider.initRole(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surface,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallDevice = constraints.maxWidth < kMaxSmallDeviceWidth;
          final role = _portalProvider.role;
          final isSuperAdmin = role?.id == kSuperAdminRoleId;
          final permissionPaths =
              isSuperAdmin
                  ? []
                  : role?.permissions
                          ?.where(
                            (element) =>
                                element.add || element.edit || element.show || element.delete,
                          )
                          .map((e) => e.path!)
                          .toList() ??
                      [];

          var buildRoutes = <String>[];
          var manageRoutes = _getRouteSections(0, 2);
          var servicesRoutes = <String>[];
          var engageRoutes = <String>[];
          var configureRoutes = _getRouteSections(2, 5);

          // var buildRoutes = <String>[];
          // var servicesRoutes = <String>[];
          // var engageRoutes = <String>[];
          // var configureRoutes = <String>[];

          if (!isSuperAdmin) {
            buildRoutes =
                buildRoutes.where((element) => permissionPaths.contains(element)).toList();
            servicesRoutes =
                servicesRoutes.where((element) => permissionPaths.contains(element)).toList();
            configureRoutes =
                configureRoutes.where((element) => permissionPaths.contains(element)).toList();
            engageRoutes =
                engageRoutes.where((element) => permissionPaths.contains(element)).toList();
            manageRoutes =
                manageRoutes.where((element) => permissionPaths.contains(element)).toList();
          }

          final drawer = AppDrawer(
            widget.navigationShell,
            buildRoutes: buildRoutes,
            configureRoutes: configureRoutes,
            engageRoutes: engageRoutes,
            manageRoutes: manageRoutes,
            servicesRoutes: servicesRoutes,
            analyticsPermission: isSuperAdmin ? true : role?.analytics ?? false,
          );

          return Scaffold(
            key: scaffoldKey,
            drawer: isSmallDevice ? drawer : null,
            body: Row(
              children: [if (!isSmallDevice) drawer, Expanded(child: widget.navigationShell)],
            ),
          );
        },
      ),
    );
  }
}
