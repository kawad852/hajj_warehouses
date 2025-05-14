import 'package:shared/shared.dart';

class UsersTable extends StatefulWidget {
  const UsersTable({super.key});

  @override
  State<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  late Query<UserModel> _query;
  late Future<QuerySnapshot<CompanyModel>> _companiesFuture;

  CollectionReference<UserModel> get _collectionRef => kFirebaseInstant.users;

  void _initializeQuery() {
    _query = _collectionRef.orderByDesc.where(MyFields.companyId, isNull: false);
    _companiesFuture = kFirebaseInstant.companies.orderByDesc.get();
  }

  @override
  void initState() {
    super.initState();
    _initializeQuery();
  }

  @override
  Widget build(BuildContext context) {
    return PortalTable(
      tableTitle: context.appLocalization.users,
      query: _query,
      data: UserModel(role: RoleEnum.admin.value),
      reference: _collectionRef.doc(),
      columns: [DataColumn(label: Text(context.appLocalization.displayName))],
      cellsBuilder: (index, snapshot) {
        final queryDocSnapshot = snapshot.docs[index];
        final data = queryDocSnapshot.data();
        return [DataCell(Text(data.displayName))];
      },
      onSave: (ref, data) async {
        if (data.companyId == null) {
          context.showSnackBar(context.appLocalization.generalError);
          return;
        }
        var reference = ref;
        if (ref == null) {
          final auth = await context.userProvider.createCompanyUser(data.username, data.password);
          final id = auth.user!.uid;
          reference = ref ?? _collectionRef.doc(id);
          data = data.copyWith(id: id, createdAt: kNowDate);
        }
        await reference!.set(data);
      },
      inputBuilder: (snapshot) {
        final data = snapshot;
        return [
          TextEditor(
            labelText: context.appLocalization.displayName,
            initialValue: data.displayName,
            onChanged: (value) {
              setState(() {
                data.displayName = value!;
              });
            },
          ),
          UsernameEditor(initialValue: data.username, onChanged: (value) => data.username = value!),
          PasswordEditor(initialValue: data.password, onChanged: (value) => data.password = value!),
          ImpededFutureBuilder(
            future: _companiesFuture,
            onComplete: (context, snapshot) {
              return DropDownEditor(
                value: data.companyId,
                onChanged: (value) {
                  setState(() {
                    data.companyId = value;
                  });
                },
                title: context.appLocalization.companies,
                items:
                    snapshot.data!.docs.map((element) {
                      return DropdownMenuItem(value: element.id, child: Text(element.data().name));
                    }).toList(),
              );
            },
          ),
        ];
      },
    );
  }
}
