import 'package:admin_portal/screens/base/policies/widgets/policy_builder.dart';
import 'package:shared/shared.dart';

class PoliciesTable extends StatefulWidget {
  const PoliciesTable({super.key});

  @override
  State<PoliciesTable> createState() => _PoliciesTableState();
}

class _PoliciesTableState extends State<PoliciesTable> {
  late Query<PolicyModel> _query;

  CollectionReference<PolicyModel> get _collectionRef => kFirebaseInstant.policies;

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
      tableTitle: context.appLocalization.policies,
      query: _query,
      data: PolicyModel(),
      header: const SizedBox.shrink(),
      reference: _collectionRef.doc(),
      columns: [DataColumn(label: Text(context.appLocalization.title))],
      cellsBuilder: (index, snapshot) {
        final queryDocSnapshot = snapshot.docs[index];
        final data = queryDocSnapshot.data();
        return [DataCell(Text(data.title))];
      },
      onSave: (ref, data) async {
        final reference = ref ?? _collectionRef.doc();
        await reference.set(data);
      },
      inputBuilder: (snapshot) {
        final data = snapshot;
        return [
          TextEditor(
            labelText: context.appLocalization.titleEn,
            initialValue: data.titleEn,
            onChanged: (value) {
              setState(() {
                data.titleEn = value!;
              });
            },
          ),
          TextEditor(
            labelText: context.appLocalization.titleAr,
            initialValue: data.titleAr,
            onChanged: (value) {
              setState(() {
                data.titleAr = value!;
              });
            },
          ),
          PolicyBuilder(
            onChanged: (value) {
              data.contentEn = value;
            },
            content: data.contentEn,
          ),
          PolicyBuilder(
            onChanged: (value) {
              data.contentAr = value;
            },
            content: data.contentAr,
          ),
        ];
      },
    );
  }
}
