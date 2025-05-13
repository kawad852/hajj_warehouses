import 'package:admin_portal/screens/base/roles/widgets/permissions_builder.dart';
import 'package:shared/shared.dart';

class RolesTable extends StatefulWidget {
  const RolesTable({super.key});

  @override
  State<RolesTable> createState() => _RolesTableState();
}

class _RolesTableState extends State<RolesTable> {
  late Query<RoleModel> _query;

  CollectionReference<RoleModel> get _collectionRef => kFirebaseInstant.roles;

  void _initializeQuery() {
    _query = _collectionRef;
  }

  @override
  void initState() {
    super.initState();
    _initializeQuery();
  }

  @override
  Widget build(BuildContext context) {
    return PortalTable(
      tableTitle: context.appLocalization.roles,
      query: _query,
      data: RoleModel(),
      reference: _collectionRef.doc(),
      columns: [DataColumn(label: Text(context.appLocalization.roles))],
      cellsBuilder: (index, snapshot) {
        final queryDocSnapshot = snapshot.docs[index];
        final data = queryDocSnapshot.data();
        return [DataCell(Text(data.nameAr!))];
      },
      onSave: (ref, data) async {
        final reference = ref ?? _collectionRef.doc();
        if (ref == null) {
          data = data.copyWith(id: reference.id, createdAt: kNowDate);
        }
        await reference.set(data);
      },
      inputBuilder: (snapshot) {
        final data = snapshot;
        data.permissions ??= [];
        return [
          TextEditor(
            labelText: context.appLocalization.nameEn,
            initialValue: data.nameEn,
            onChanged: (value) {
              setState(() {
                data.nameEn = value!;
              });
            },
          ),
          TextEditor(
            labelText: context.appLocalization.nameAr,
            initialValue: data.nameAr,
            onChanged: (value) {
              setState(() {
                data.nameAr = value!;
              });
            },
          ),
          ListBody(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  context.appLocalization.permissions,
                  style: context.textTheme.titleLarge,
                ),
              ),
              PermissionsBuilder(
                initialLocation: data.initialLocation,
                onChanged: (value) => data.initialLocation = value,
                permissions: data.permissions!,
              ),
            ],
          ),
        ];
      },
    );
  }
}
