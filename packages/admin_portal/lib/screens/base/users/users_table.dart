import 'package:shared/shared.dart';

class UsersTable extends StatefulWidget {
  const UsersTable({super.key});

  @override
  State<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  late Query<UserModel> _query;

  void _initializeQuery() {
    _query = kFirebaseInstant.users;
  }

  @override
  void initState() {
    super.initState();
    _initializeQuery();
  }

  @override
  Widget build(BuildContext context) {
    return PortalTable(
      tableTitle: 'Users',
      query: _query,
      header: IconButton(
        onPressed: () {
          setState(() {});
        },
        icon: Icon(Icons.reset_tv),
      ),
      tableBuilder: (index, snapshot) {
        final queryDocSnapshot = snapshot.docs[index];
        final data = queryDocSnapshot.data();
        return [
          PortalContent(
            column: DataColumn(label: Text("الإسم")),
            cell: DataCell(Text(data.displayName)),
          ),
        ];
      },
      onSave: (reference, data) async {
        await reference.update(data.toJson());
        // print("name::: ${snapshot.name}");
      },
      inputBuilder: (snapshot) {
        final data = snapshot;
        return [
          TextEditor(
            labelText: "الإسم",
            initialValue: data.displayName,
            onChanged: (value) {
              setState(() {
                data.displayName = value!;
              });
            },
          ),
        ];
      },
    );
  }
}
