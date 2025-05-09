import 'package:shared/shared.dart';
import 'package:shared/src/providers/portal_provider.dart';

extension ProvidersExtension on BuildContext {
  UserProvider get userProvider => read<UserProvider>();
  AppProvider get appProvider => read<AppProvider>();
  LocationProvider get locationProvider => read<LocationProvider>();
  InventoryProvider get inventoryProvider => read<InventoryProvider>();
  PortalProvider get portalProvider => read<PortalProvider>();
}
