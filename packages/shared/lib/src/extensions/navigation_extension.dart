import 'package:app/screens_exports.dart';

import '../../shared.dart';

extension NavigationExtension on BuildContext {
  String get currentRoutePath => GoRouter.of(this).routeInformationProvider.value.uri.path;

  Future<T?> navigate<T>(WidgetBuilder builder, {bool fullscreenDialog = false, String? name}) {
    return Navigator.push<T?>(
      this,
      MaterialPageRoute(
        builder: builder,
        fullscreenDialog: fullscreenDialog,
        settings: RouteSettings(name: name),
      ),
    ).then((value) => value);
  }

  Future<T?> pushAndRemoveUntil<T>(WidgetBuilder builder) {
    return Navigator.pushAndRemoveUntil<T?>(
      this,
      MaterialPageRoute(builder: builder),
      (route) => false,
    ).then((value) => value);
  }

  void goToNavBar() {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(
        builder: (context) {
          return const AppNavBar();
        },
      ),
      (route) => false,
    );
  }

  // void pop([value]) => Navigator.pop(this, value);
}
