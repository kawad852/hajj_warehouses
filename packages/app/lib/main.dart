import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey(debugLabel: "Main Navigator");

// flutter pub run build_runner build --delete-conflicting-outputs
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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await _logout();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
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
      Filter(MyFields.idBranch, isEqualTo: kSelectedBranchId),
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

  @override
  Widget build(BuildContext context) {
    final colorScheme = MyColorScheme(true).value;
    return Consumer2<AppProvider, UserProvider>(
      builder: (BuildContext context, appProvider, userProvider, Widget? child) {
        return MultiProvider(
          // key: ValueKey(userProvider.isAuthenticated),
          providers: [
            StreamProvider<UserModel>.value(
              key: ValueKey(userProvider.isAuthenticated),
              value:
                  userProvider.isAuthenticated
                      ? userProvider.userDocRef.snapshots().map(
                        (event) => event.data() ?? UserModel(),
                      )
                      : Stream.value(UserModel()),
              initialData: MySharedPreferences.user ?? UserModel(),
              updateShouldNotify: (initialValue, value) {
                MySharedPreferences.user = value;
                Future.microtask(() {
                  if (userProvider.isAuthenticated && (value.id == null || value.blocked)) {
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
              value:
                  userProvider.isAuthenticated && kBranch != null
                      ? _outOfStockStream
                      : Stream.value([]),
              initialData: const [],
              updateShouldNotify: (initialValue, value) {
                return true;
              },
            ),
            StreamProvider<BranchModel>.value(
              key: ValueKey(userProvider.isAuthenticated),
              value:
                  userProvider.isAuthenticated && kBranch != null
                      ? _branchStream
                      : Stream.value(BranchModel()),
              initialData: BranchModel(),
              updateShouldNotify: (initialValue, value) {
                return true;
              },
            ),
            StreamProvider<bool>.value(value: null, initialData: true),
          ],
          child: MaterialApp(
            navigatorKey: rootNavigatorKey,
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: appProvider.appLocale,
            theme: MyTheme().materialTheme(
              context,
              colorScheme,
              fillColor: const Color(0xFFF2F2F2),
              cardThemeData: CardThemeData(
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
