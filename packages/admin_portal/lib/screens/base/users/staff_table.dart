import 'package:shared/shared.dart';

class StaffTable extends StatefulWidget {
  const StaffTable({super.key});

  @override
  State<StaffTable> createState() => _StaffTableState();
}

class _StaffTableState extends State<StaffTable> {
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
      tableTitle: 'Staff',
      query: _query,
      header: IconButton(
        onPressed: () {
          setState(() {});
        },
        icon: Icon(Icons.reset_tv),
      ),
      columns: [DataColumn(label: Text("الإسم"))],
      cellsBuilder: (index, snapshot) {
        final queryDocSnapshot = snapshot.docs[index];
        final data = queryDocSnapshot.data();
        return [DataCell(Text(data.displayName))];
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
