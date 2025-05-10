import 'package:shared/shared.dart';

class DatabaseUtils {
  Future<void> init() async {
    try {
      ///Roles
      final superAdminRole = RoleModel(
        id: kSuperAdminRoleId,
        nameEn: 'Super Admin',
        nameAr: 'سوبر ادمن',
        createdAt: DateTime.now(),
        initialLocation: '/policies',
      );

      await FirebaseFirestore.instance.roles.doc(superAdminRole.id).set(superAdminRole);

      /// admins
      final superAdmin = UserModel(
        roleId: kSuperAdminRoleId,
        createdAt: DateTime.now(),
        email: 'admin@gmail.com',
        password: '123456',
        displayName: "خالد عوص",
        phoneCountryCode: kFallBackCountryCode,
        phoneNum: '791595029',
      );

      final superAdminJson = await _createUser(superAdmin);

      await FirebaseFirestore.instance
          .collection(MyCollections.users)
          .doc(superAdminJson['id'])
          .set(superAdminJson);

      debugPrint("FINISHED SUCCESSFULLY");
    } catch (e) {
      debugPrint("error: $e");
    }
  }

  Future<Map<String, dynamic>> _createUser(UserModel admin) async {
    try {
      HttpsCallable callable = FirebaseFunctions.instanceFor(
        region: "europe-west3",
      ).httpsCallable('createUser');
      final results = await callable.call(<String, dynamic>{
        'email': admin.email!,
        'password': admin.password,
      });
      final data = results.data as Map<String, dynamic>;
      admin.id = data['uid'];
      return admin.toJson();
    } on FirebaseFunctionsException catch (e) {
      debugPrint("FirebaseFunctionsException::: ${e.code}");
      rethrow;
    } catch (e) {
      debugPrint("ERROR::: $e");
      rethrow;
    }
  }
}
