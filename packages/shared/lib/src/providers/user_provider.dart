import 'dart:async';

import 'package:app/screens_exports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared/shared.dart';

import '../../app_routes.dart';

class UserProvider extends ChangeNotifier {
  Function()? onGuestRegistration;

  User? get user => _firebaseAuth.currentUser;

  String? get userUid => user?.uid;

  bool get isAuthenticated => user != null && !user!.isAnonymous;

  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;

  DocumentReference<UserModel> get userDocRef => _firebaseFirestore.users.doc(userUid);

  Stream<DocumentSnapshot<UserModel>> get userStream => userDocRef.snapshots();

  CollectionReference<BasketModel> get userBasketCollectionRef => userDocRef
      .collection(MyCollections.basket)
      .withConverter<BasketModel>(
        fromFirestore: (snapshot, _) => BasketModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  CollectionReference<MessageModel> get messagesCollectionRef => userDocRef
      .collection(MyCollections.messages)
      .withConverter<MessageModel>(
        fromFirestore: (snapshot, _) => MessageModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  Stream<QuerySnapshot<BasketModel>> get userBasketStream => userBasketCollectionRef.snapshots();
  CollectionReference<Map<String, dynamic>> get addressesCollectionRef =>
      userDocRef.collection(MyCollections.addresses);
  CollectionReference<AddressModel> get addressesCollectionRefConverted => userDocRef
      .collection(MyCollections.addresses)
      .withConverter<AddressModel>(
        fromFirestore: (snapshot, _) => AddressModel.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) {
          final data = snapshot.toJson();
          if (snapshot.createdAt == null) {
            data['createdAt'] = FieldValue.serverTimestamp();
          }
          return data;
        },
      );

  void onGuestRoute(Function() callBack) {
    onGuestRegistration = callBack;
  }

  Future<void> login(
    BuildContext context, {
    required AuthEnum authEnum,
    required String email,
    required String password,
    bool portalLogin = false,
  }) async {
    await ApiService.fetch(
      context,
      callBack: () async {
        // final user = UserModel();

        final auth = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        final userDocument = await _firebaseFirestore.users.doc(auth.user!.uid).get();
        final user = userDocument.data()!;

        if (userDocument.exists) {
          if (context.mounted && user.blocked) {
            context.showSnackBar(context.appLocalization.authFailed);
            return;
          }

          MySharedPreferences.user = user;
        } else {
          if (context.mounted) {
            context.showSnackBar(context.appLocalization.authFailed);
          }
        }

        if (portalLogin && context.mounted) {
          if (user.roleId == null) {
            Fluttertoast.showToast(msg: context.appLocalization.authFailed);
          } else {
            await context.portalProvider.initRole(context);
            if (context.mounted) {
              notifyListeners();
              GoRouter.of(context).go(context.portalProvider.role!.initialLocation!);
            }
          }
          return;
        }

        notifyListeners();

        if (context.mounted) {
          if (MySharedPreferences.user?.role == RoleEnum.admin.value) {
            context.pushAndRemoveUntil((context) => const ChooseBranchScreen());
          } else {
            MySharedPreferences.branch = MySharedPreferences.user!.branch!;
            context.goToNavBar();
          }
        }
      },
    );
  }

  void handleUserNavigation(BuildContext context) {
    if (onGuestRegistration != null) {
      onGuestRegistration!();
      onGuestRegistration = null;
    } else {
      context.goToNavBar();
    }
  }

  Future<String?> _getDeviceToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      return null;
    }
  }

  Future<void> updateDeviceToken(BuildContext context) async {
    try {
      final deviceToken = await _getDeviceToken();
      debugPrint("DeviceToken:: $deviceToken");
      if (context.mounted && isAuthenticated) {
        userDocRef.update({MyFields.deviceToken: deviceToken});
      }
    } catch (e) {
      debugPrint("DeviceTokenError:: $e");
    }
  }

  Future<void> logout(BuildContext context, {bool adminPanel = false}) async {
    ApiService.fetch(
      context,
      callBack: () async {
        await _firebaseAuth.signOut();
        MySharedPreferences.clearStorage();
        notifyListeners();
        if (context.mounted) {
          if (adminPanel) {
            LoginRoute().go(context);
          } else {
            context.pushAndRemoveUntil((context) {
              return const LoginScreen();
            });
          }
        }
      },
    );
  }

  Future<void> deleteAccount(BuildContext context) async {
    ApiService.fetch(
      context,
      callBack: () async {
        // await user?.delete();
        if (context.mounted) {
          logout(context);
          context.showSnackBar("context.appLocalization.deleteAccountSuccess");
        }
      },
    );
  }

  void handleGuest(BuildContext context, {required VoidCallback action}) {
    if (isAuthenticated) {
      action();
    } else {
      // context.push(
      //   (context) {
      //     return const RegistrationScreen(
      //       guestRoute: kLoginRouteName,
      //       showGuestButton: false,
      //     );
      //   },
      //   name: kLoginRouteName,
      //   fullscreenDialog: true,
      // ).then((value) {
      //   if (isAuthenticated) {
      //     action();
      //   }
      // });
    }
  }

  void selectBranch(LightBranchModel branch) {
    MySharedPreferences.branch = branch;
    userDocRef.update({MyFields.branch: MySharedPreferences.branch!.toJson()});
    notifyListeners();
  }
}
