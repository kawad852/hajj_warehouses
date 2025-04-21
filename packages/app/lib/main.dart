import 'package:app/screens_exports.dart';
import 'package:shared/object_box_exports.dart';
import 'package:shared/shared.dart';

import 'firebase_options.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey(debugLabel: "Main Navigator");

// dart pub global activate melos
// melos bootstrap

// khaled@gmail.com
// 123456

Future<void> _logout() async {
  await FirebaseAuth.instance.signOut();
  MySharedPreferences.clearStorage();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  MyObjectBoxes.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await _logout();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => InventoryProvider()),
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
  Widget _toggleScreen(BuildContext context) {
    if (MySharedPreferences.user?.id != null) {
      return const AppNavBar();
    } else {
      return const LoginScreen();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer2<AppProvider, UserProvider>(
      builder: (BuildContext context, appProvider, userProvider, Widget? child) {
        final colorScheme = ColorScheme.fromSeed(
          seedColor: const Color(0xFF708D81),
          surface: Colors.white,
          brightness: appProvider.appTheme == ThemeEnum.light ? Brightness.light : Brightness.dark,
        );
        return MultiProvider(
          providers: [
            if (userProvider.isAuthenticated) ...[
              StreamProvider<UserModel>.value(
                value: userProvider.userDocRef.snapshots().map(
                  (event) => event.data() ?? UserModel(),
                ),
                initialData: MySharedPreferences.user ?? UserModel(),
                lazy: false,
                updateShouldNotify: (initialValue, value) {
                  MySharedPreferences.user = value;
                  Future.microtask(() {
                    if (value.id == null || value.blocked) {
                      Fluttertoast.showToast(msg: "Authorization Failed");
                      // ignore: use_build_context_synchronously
                      userProvider.logout(rootNavigatorKey.currentContext!);
                    }
                  });
                  return true;
                },
              ),
              StreamProvider<List<BasketModel>>.value(
                value: userProvider.userBasketStream.map(
                  (event) => event.docs.map((e) => e.data()).toList(),
                ),
                initialData: MySharedPreferences.basket,
                updateShouldNotify: (initialValue, value) {
                  MySharedPreferences.basket = value;
                  return true;
                },
              ),
            ],
            StreamProvider<bool>.value(value: null, initialData: true),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            navigatorKey: rootNavigatorKey,
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: appProvider.appLocale,
            theme: ThemeData(
              colorScheme: colorScheme,
              useMaterial3: true,
              fontFamily: GoogleFonts.cairo().fontFamily!,
              actionIconTheme: ActionIconThemeData(
                backButtonIconBuilder: (BuildContext context) {
                  return const CustomBack();
                },
              ),
              appBarTheme: const AppBarTheme(centerTitle: true),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: const Color(0xFFF2F2F2),
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
              ),
              cardTheme: CardThemeData(
                color: colorScheme.onInverseSurface,
                margin: EdgeInsets.zero,
              ),
            ),
            home: _toggleScreen(context),
            // home: const AppNavBar(),
          ),
        );
      },
    );
  }
}
