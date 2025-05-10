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
      tableTitle: context.appLocalization.branches,
      query: _query,
      data: BranchModel(),
      reference: _collectionRef.doc(),
      columns: [DataColumn(label: Text(context.appLocalization.name))],
      cellsBuilder: (index, snapshot) {
        final queryDocSnapshot = snapshot.docs[index];
        final data = queryDocSnapshot.data();
        return [DataCell(Text(data.name))];
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
        return [
          TextEditor(
            labelText: context.appLocalization.name,
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
