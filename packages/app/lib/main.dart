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
  get _outOfStockStream {
    final filter = Filter.and(
      Filter(MyFields.branchId, isEqualTo: kSelectedBranchId),
      Filter(MyFields.status, isNotEqualTo: ItemStatusEnum.inStock.value),
    );
    return kFirebaseInstant.items
        .where(filter)
        .orderByDesc
        .snapshots()
        .map((e) => e.docs.map((e) => e.data()).toList());
  }

  get _branchStream =>
      kFirebaseInstant.branches.doc(kSelectedBranchId).snapshots().map((e) => e.data()!);

  Widget _toggleScreen(BuildContext context) {
    if (MySharedPreferences.user?.id != null && MySharedPreferences.branch?.id != null) {
      return const AppNavBar();
    } else {
      return const LoginScreen();
    }
  }

  @override
  void initState() {
    super.initState();
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
          key: ValueKey(userProvider.isAuthenticated),
          providers: [
            if (userProvider.isAuthenticated && kBranch != null) ...[
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
              StreamProvider<List<ItemModel>>.value(
                key: ValueKey(userProvider.isAuthenticated),
                value: _outOfStockStream,
                initialData: const [],
                updateShouldNotify: (initialValue, value) {
                  return true;
                },
              ),
              StreamProvider<BranchModel>.value(
                key: ValueKey(userProvider.isAuthenticated),
                value: _branchStream,
                initialData: BranchModel(),
                updateShouldNotify: (initialValue, value) {
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
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.error),
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.error),
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
