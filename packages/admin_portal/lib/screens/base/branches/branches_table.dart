import 'package:shared/shared.dart';

class BranchesTable extends StatefulWidget {
  const BranchesTable({super.key});

  @override
  State<BranchesTable> createState() => _BranchesTableState();
}

class _BranchesTableState extends State<BranchesTable> {
  late Query<BranchModel> _query;

  CollectionReference<BranchModel> get _collectionRef => kFirebaseInstant.branches;

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
      tableTitle: 'Branches',
      query: _query,
      data: BranchModel(),
      reference: _collectionRef.doc(),
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
        return [DataCell(Text(data.name))];
      },
      onSave: (reference, data) async {
        await reference?.update(data.toJson());
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
