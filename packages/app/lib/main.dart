import 'package:app/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'firebase_options.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey(debugLabel: "Main Navigator");

// dart pub global activate melos
// melos bootstrap

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  MyObjectBoxes.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAuth.instance.signOut();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
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
  // Widget _toggleScreen(BuildContext context) {
  //   if (MySharedPreferences.user?.id != null) {
  //     return AppNavBar();
  //   } else {
  //     return RegistrationScreen();
  //   }
  // }

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
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Color(0xFFF2F2F2),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              cardTheme: CardThemeData(
                color: colorScheme.onInverseSurface,
                margin: EdgeInsets.zero,
              ),
            ),
            // home: _toggleScreen(context),
            home: const LoginScreen(),
          ),
        );
      },
    );
  }
}
