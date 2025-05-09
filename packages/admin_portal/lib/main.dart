import 'dart:async';

import 'package:flutter/services.dart';
import 'package:shared/app_routes.dart';
import 'package:shared/shared.dart';

// -d chrome --web-renderer html

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(AppProvider.getCountryCode());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GoRouter.optionURLReflectsImperativeAPIs = true;
  await MySharedPreferences.init();
  // await Hive.initFlutter();
  // await MyHive.init();
  // await FirebaseAuth.instance.signOut();
  // MySharedPreferences.clearStorage();
  setPathUrlStrategy();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
        // ChangeNotifierProvider(create: (context) => DrawerProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late UserProvider _userProvider;

  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _userProvider = context.userProvider;
    _router = GoRouter(
      routes: $appRoutes,
      initialLocation:
          _userProvider.isAuthenticated
              ? MySharedPreferences.role?.initialLocation
              : LoginRoute().location,
      navigatorKey: rootNavigatorKey,
      redirect: (context, state) {
        if (_userProvider.isAuthenticated) {
          final hasPermission = context.portalProvider.hasLocationPermission(state.matchedLocation);
          if (!hasPermission) {
            return NoAccessRoute().location;
          }
          return null;
        } else if (!_userProvider.isAuthenticated) {
          return LoginRoute().location;
        } else {
          return null;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return MultiProvider(
          providers: [
            StreamProvider<UserModel?>.value(
              key: ValueKey(userProvider.isAuthenticated),
              value:
                  userProvider.isAuthenticated
                      ? _userProvider.userStream.map((event) => event.data())
                      : null,
              initialData: MySharedPreferences.user,
              updateShouldNotify: (initialValue, value) {
                MySharedPreferences.user = value;
                Future.microtask(() {
                  if (value?.blocked ?? false) {
                    // ignore: use_build_context_synchronously
                    context.showSnackBar(context.appLocalization.authFailed);
                    // ignore: use_build_context_synchronously
                    _userProvider.logout(context);
                  }
                });
                return true;
              },
            ),
            StreamProvider<bool>.value(value: null, initialData: true),
          ],
          child: Consumer<AppProvider>(
            builder: (context, appProvider, child) {
              return MaterialApp.router(
                builder: EasyLoading.init(),
                debugShowCheckedModeBanner: false,
                scrollBehavior: WebScrollBehavior(),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: appProvider.appLocale,
                theme: MyTheme().materialTheme(
                  context,
                  MyColorScheme(appProvider.appTheme == ThemeEnum.light).value,
                ),
                routerConfig: _router,
                // navigatorKey: rootNavigatorKey,
                // home: _userProvider.isAuthenticated ? AppNavRailCopy() : LoginScreen(),
              );
            },
          ),
        );
      },
    );
  }
}

// https://firebasestorage.googleapis.com/v0/b/suqnashmi.appspot.com/o/providers%2FScreenshot%202024-12-18%20at%201.04.55%E2%80%AFPM.png?alt=media&token=f54735d2-d7dc-4f10-9569-7ed4f9061fb2
