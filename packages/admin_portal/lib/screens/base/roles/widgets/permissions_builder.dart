import 'package:shared/app_routes.dart';
import 'package:shared/shared.dart';

class PermissionsBuilder extends StatefulWidget {
  final String? initialLocation;
  final List<PermissionModel> permissions;
  final Function(String?) onChanged;

  const PermissionsBuilder({
    super.key,
    required this.permissions,
    required this.initialLocation,
    required this.onChanged,
  });

  @override
  State<PermissionsBuilder> createState() => _PermissionsBuilderState();
}

class _PermissionsBuilderState extends State<PermissionsBuilder> {
  late List<PermissionModel> _permissions;
  final List<RouteBase> _routes = $appNavBarRoute.routes;

  @override
  void initState() {
    super.initState();
    _permissions = widget.permissions;
  }

  @override
  Widget build(BuildContext context) {
    final dropDownValues = _permissions.where(
      (element) => element.add || element.edit || element.show || element.delete,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropDownEditor<String?>(
          key: ValueKey(dropDownValues.length),
          value: widget.initialLocation,
          onChanged: widget.onChanged,
          title: context.appLocalization.initialLocation,
          items:
              dropDownValues.map((e) {
                return DropdownMenuItem(
                  value: e.path!,
                  child: Text(PortalHelper.getPathLabel(context, e.path!)),
                );
              }).toList(),
        ),
        const SizedBox(height: 10),
        Wrap(
          runSpacing: 10,
          spacing: 10,
          children:
              _routes.map((e) {
                final route = e as GoRoute;
                final path = route.path;
                final bool isUsersPath = path == UsersTableRoute().location;
                final permission = _permissions.singleWhere(
                  (element) => element.path == path,
                  orElse: () {
                    final p = PermissionModel(
                      path: path,
                      add: false,
                      show: false,
                      edit: false,
                      delete: false,
                    );
                    _permissions.add(p);
                    return p;
                  },
                );
                return ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: kMaxWidth / 3),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CheckboxListTile(
                            value:
                                permission.add ||
                                permission.edit ||
                                permission.show ||
                                permission.delete,
                            onChanged: (value) {
                              setState(() {
                                permission.add = value!;
                                permission.edit = value;
                                permission.show = value;
                                permission.delete = value;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(PortalHelper.getPathLabel(context, route.path)),
                          ),
                          const Divider(),
                          CheckboxListTile(
                            value: isUsersPath ? false : permission.add,
                            onChanged:
                                isUsersPath
                                    ? null
                                    : (value) {
                                      setState(() {
                                        permission.add = value!;
                                      });
                                    },
                            title: Text(context.appLocalization.add),
                          ),
                          CheckboxListTile(
                            value: isUsersPath ? false : permission.edit,
                            onChanged:
                                isUsersPath
                                    ? null
                                    : (value) {
                                      setState(() {
                                        permission.edit = value!;
                                      });
                                    },
                            title: Text(context.appLocalization.edit),
                          ),
                          CheckboxListTile(
                            value: isUsersPath ? false : permission.show,
                            onChanged:
                                isUsersPath
                                    ? null
                                    : (value) {
                                      setState(() {
                                        permission.show = value!;
                                      });
                                    },
                            title: Text(context.appLocalization.show),
                          ),
                          CheckboxListTile(
                            value: permission.delete,
                            onChanged: (value) {
                              setState(() {
                                permission.delete = value!;
                              });
                            },
                            title: Text(context.appLocalization.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
