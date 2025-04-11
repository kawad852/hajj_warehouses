import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/widgets/extensions/snackbar_extension.dart';

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

  Future<void> register(
    BuildContext context,
    UserCredential auth, {
    required String? guestRoute,
    required String? provider,
    String? displayName,
  }) async {
    await ApiService.fetch(
      context,
      callBack: () async {
        final user = UserModel();
        user.id = auth.user?.uid;
        user.email = auth.user?.email;
        user.displayName = displayName ?? auth.user?.displayName;
        user.deviceToken = await _getDeviceToken();
        user.languageCode = MySharedPreferences.language;

        final userDocument = await _firebaseFirestore.users.doc(user.id).get();

        if (userDocument.exists) {
          if (context.mounted && userDocument.data()!.blocked) {
            context.showSnackBar(context.appLocalization.authFailed);
            return;
          }
          MySharedPreferences.user = userDocument.data()!;
        } else {
          MySharedPreferences.user = user;
          final json = {...user.toJson(), MyFields.createdAt: FieldValue.serverTimestamp()};
          await FirebaseFirestore.instance.collection(MyCollections.users).doc(user.id).set(json);
        }

        notifyListeners();

        if (context.mounted) {
          if (guestRoute == null) {
            context.goToNavBar();
          } else {
            Navigator.popUntil(context, (route) => route.settings.name == kLoginRouteName);
            Navigator.pop(context);
          }
          // handleUserNavigation(context);
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

  Future<void> logout(BuildContext context) async {
    ApiService.fetch(
      context,
      callBack: () async {
        await userDocRef.update({'deviceId': null});
        await _firebaseAuth.signOut();
        MySharedPreferences.clearStorage();
        notifyListeners();
        if (context.mounted) {
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(builder: (context) {
          //     return const RegistrationScreen();
          //   }),
          //   (route) => false,
          // );
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
          context.showSnackBar(context.appLocalization.deleteAccountSuccess);
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
}
