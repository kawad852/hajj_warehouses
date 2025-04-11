import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';
import '../providers/location_provider.dart';
import '../providers/user_provider.dart';

extension ProvidersExtension on BuildContext {
  UserProvider get userProvider => read<UserProvider>();
  AppProvider get appProvider => read<AppProvider>();
  LocationProvider get locationProvider => read<LocationProvider>();
}
