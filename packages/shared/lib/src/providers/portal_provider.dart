import 'package:shared/shared.dart';

class PortalProvider extends ChangeNotifier {
  RoleModel? role = MySharedPreferences.role;

  Future<DocumentSnapshot<RoleModel>> initRole(BuildContext context) async {
    return kFirebaseInstant.roles.doc(MySharedPreferences.user!.roleId).get().then((value) {
      role = value.data()!;
      MySharedPreferences.role = value.data()!;
      return value;
    });
  }

  bool hasTablePermission(BuildContext context, TableMenuOption option) {
    return true;
    final user = Provider.of<UserModel>(context, listen: false);

    if (user.id == null) {
      return false;
    }
    if (user.roleId == kSuperAdminRoleId) {
      return true;
    }
    final path = context.currentRoutePath;
    final permission = role!.permissions!.where((element) => element.path == path).first;
    switch (option) {
      case TableMenuOption.add:
        return permission.add;
      case TableMenuOption.edit:
        return permission.edit;
      case TableMenuOption.delete:
        return permission.delete;
    }
  }

  bool hasLocationPermission(String location) {
    if (role?.permissions != null) {
      if (role?.id == kSuperAdminRoleId) {
        return true;
      }
      final permissionPath =
          role?.permissions!
              .singleWhere(
                (element) =>
                    element.path == location &&
                    (element.add || element.edit || element.show || element.delete),
                orElse: () => PermissionModel(),
              )
              .path;
      return permissionPath != null;
    } else {
      return true;
    }
  }
}
