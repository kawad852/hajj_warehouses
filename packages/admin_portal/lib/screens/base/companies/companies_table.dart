import 'package:shared/shared.dart';

class CompaniesTable extends StatefulWidget {
  const CompaniesTable({super.key});

  @override
  State<CompaniesTable> createState() => _CompaniesTableState();
}

class _CompaniesTableState extends State<CompaniesTable> {
  late Query<CompanyModel> _query;

  CollectionReference<CompanyModel> get _collectionRef => kFirebaseInstant.companies;

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
      tableTitle: 'Companies',
      query: _query,
      data: CompanyModel(createdAt: kNowDate),
      reference: _collectionRef.doc(),
      convertor: CompanyModel.fromJson,
      columns: [DataColumn(label: Text("تاريخ الإنشاء")), DataColumn(label: Text("الإسم"))],
      cellsBuilder: (index, snapshot) {
        final queryDocSnapshot = snapshot.docs[index];
        final data = queryDocSnapshot.data();
        return [
          DataCell(Text(data.createdAt.getDefaultFormattedDate(context))),
          DataCell(Text(data.name)),
        ];
      },
      onSave: (reference, data) async {
        await reference.set(data);
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
