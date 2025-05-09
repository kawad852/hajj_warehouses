import 'package:shared/shared.dart';

class BranchesScreen extends StatefulWidget {
  const BranchesScreen({super.key});

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  late Query<BranchModel> _query;

  void _initializeQuery() {
    _query = kFirebaseInstant.branches;
  }

  @override
  void initState() {
    super.initState();
    _initializeQuery();
  }

  @override
  Widget build(BuildContext context) {
    return PortalTable(
      tableTitle: 'Branches',
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
          PortalContent(column: DataColumn(label: Text("الإسم")), cell: DataCell(Text(data.name))),
        ];
      },
      onSave: (reference, snapshot) {
        reference.update({"name": snapshot.name});
        // print("name::: ${snapshot.name}");
      },
      inputBuilder: (snapshot) {
        final data = snapshot;
        return [
          TextEditor(
            labelText: "الإسم",
            initialValue: data.name,
            onChanged: (value) {
              setState(() {
                data.name = value!;
              });
            },
          ),
        ];
      },
    );
  }
}
