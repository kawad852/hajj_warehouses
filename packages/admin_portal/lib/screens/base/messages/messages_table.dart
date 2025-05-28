import 'package:shared/shared.dart';

class MessagesTable extends StatefulWidget {
  const MessagesTable({super.key});

  @override
  State<MessagesTable> createState() => _MessagesTableState();
}

class _MessagesTableState extends State<MessagesTable> {
  late Query<AdminMessageModel> _query;

  CollectionReference<AdminMessageModel> get _collectionRef => kFirebaseInstant.adminMessages;

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
      tableTitle: context.appLocalization.messages,
      query: _query,
      data: AdminMessageModel(createdAt: kNowDate),
      reference: _collectionRef.doc(),
      convertor: CompanyModel.fromJson,
      columns: [
        DataColumn(label: Text(context.appLocalization.createdAt)),
        DataColumn(label: Text(context.appLocalization.message)),
      ],
      cellsBuilder: (index, snapshot) {
        final queryDocSnapshot = snapshot.docs[index];
        final data = queryDocSnapshot.data();
        return [
          DataCell(Text(data.createdAt!.getDefaultFormattedDate(context))),
          DataCell(Text(data.msg!)),
        ];
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
            labelText: context.appLocalization.message,
            initialValue: data.msg,
            onChanged: (value) {
              setState(() {
                data.msg = value!;
              });
            },
          ),
        ];
      },
    );
  }
}
