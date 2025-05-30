import 'package:shared/shared.dart';

extension ProvidersExtension on BuildContext {
  UserProvider get userProvider => read<UserProvider>();
  AppProvider get appProvider => read<AppProvider>();
  InventoryProvider get inventoryProvider => read<InventoryProvider>();
  PortalProvider get portalProvider => read<PortalProvider>();
  DrawerProvider get drawerProvider => read<DrawerProvider>();
}
