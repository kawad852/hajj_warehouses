import 'package:admin_portal/screens/base/drawer/widgets/drawer_tile.dart';
import 'package:admin_portal/screens/base/drawer/widgets/rail_expansion_tile.dart';
import 'package:admin_portal/screens/base/drawer/widgets/user_menu_anchor.dart';
import 'package:shared/shared.dart';

class AppDrawer extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<String> buildRoutes;
  final List<String> configureRoutes;
  final List<String> engageRoutes;
  final List<String> manageRoutes;
  final List<String> servicesRoutes;
  final bool analyticsPermission;

  const AppDrawer(
    this.navigationShell, {
    super.key,
    required this.buildRoutes,
    required this.configureRoutes,
    required this.engageRoutes,
    required this.manageRoutes,
    required this.analyticsPermission,
    required this.servicesRoutes,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with AutomaticKeepAliveClientMixin {
  late DrawerProvider _drawerProvider;
  late ScrollController _scrollController;

  int get _shellIndex => widget.navigationShell.currentIndex;

  bool get _analyticsPermission => widget.analyticsPermission;
  List<String> get buildRoutes => widget.buildRoutes;
  List<String> get servicesRoutes => widget.servicesRoutes;
  List<String> get configureRoutes => widget.configureRoutes;
  List<String> get engageRoutes => widget.engageRoutes;
  List<String> get manageRoutes => widget.manageRoutes;

  _onDestinationSelected(int index) {
    if (context.mediaQuery.width < kMaxSmallDeviceWidth) {
      context.pop();
    }
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  Widget _buildTile(int index, String title) {
    return DrawerTile(
      title: title,
      selected: _shellIndex == index,
      onTap: () => _onDestinationSelected(index),
    );
  }

  @override
  void initState() {
    super.initState();
    _drawerProvider = context.drawerProvider;
    _scrollController = ScrollController(initialScrollOffset: _drawerProvider.scrollOffset);
    _scrollController.addListener(() {
      _drawerProvider.scrollOffset = _scrollController.offset;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: Drawer(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              ListTile(leading: Image.asset(MyImages.logo, height: 30)),
              ListTile(leading: const UserMenuAnchor()),
              Divider(indent: 10, endIndent: 10, color: context.colorScheme.outlineVariant),

              /// Manage
              if (manageRoutes.isNotEmpty)
                RailExpansionTile(
                  iconData: FontAwesomeIcons.lightClipboardList,
                  title: context.appLocalization.manage,
                  index: 0,
                  initiallyExpanded: _drawerProvider.manageInitiallyExpanded,
                  child: ListBody(
                    children:
                        manageRoutes.map((element) {
                          return _buildTile(
                            PortalHelper.railPaths.indexOf(element),
                            PortalHelper.getPathLabel(context, element),
                          );
                        }).toList(),
                  ),
                ),

              // ///build
              // if (buildRoutes.isNotEmpty)
              //   RailExpansionTile(
              //     iconData: FontAwesomeIcons.lightScrewdriverWrench,
              //     title: context.appLocalization.build,
              //     index: 1,
              //     initiallyExpanded: _drawerProvider.buildInitiallyExpanded,
              //     child: ListBody(
              //       children:
              //           buildRoutes.map((element) {
              //             return _buildTile(
              //               PortalHelper.railPaths.indexOf(element),
              //               PortalHelper.getPathLabel(context, element),
              //             );
              //           }).toList(),
              //     ),
              //   ),
              //
              // ///Services
              // if (servicesRoutes.isNotEmpty)
              //   RailExpansionTile(
              //     iconData: FontAwesomeIcons.toolbox,
              //     title: context.appLocalization.services,
              //     index: 1,
              //     initiallyExpanded: _drawerProvider.buildInitiallyExpanded,
              //     child: ListBody(
              //       children:
              //           servicesRoutes.map((element) {
              //             return _buildTile(
              //               PortalHelper.railPaths.indexOf(element),
              //               PortalHelper.getPathLabel(context, element),
              //             );
              //           }).toList(),
              //     ),
              //   ),
              //
              // /// Engage
              // if (engageRoutes.isNotEmpty)
              //   RailExpansionTile(
              //     iconData: FontAwesomeIcons.lightHandshake,
              //     title: context.appLocalization.engage,
              //     index: 2,
              //     initiallyExpanded: _drawerProvider.engageInitiallyExpanded,
              //     child: ListBody(
              //       children:
              //           engageRoutes.map((element) {
              //             return _buildTile(
              //               PortalHelper.railPaths.indexOf(element),
              //               PortalHelper.getPathLabel(context, element),
              //             );
              //           }).toList(),
              //     ),
              //   ),
              //
              /// Configure
              if (configureRoutes.isNotEmpty)
                RailExpansionTile(
                  iconData: FontAwesomeIcons.lightGear,
                  title: context.appLocalization.configure,
                  index: 3,
                  initiallyExpanded: _drawerProvider.configureInitiallyExpanded,
                  child: ListBody(
                    children:
                        configureRoutes.map((element) {
                          return _buildTile(
                            PortalHelper.railPaths.indexOf(element),
                            PortalHelper.getPathLabel(context, element),
                          );
                        }).toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
