import 'package:shared/shared.dart';

class PortalInput<T> extends StatefulWidget {
  // final T q;
  // final DocumentReference<T> ref;
  final QueryDocumentSnapshot<T> queryDocSnapshot;
  final List<Widget> Function(T snapshot) inputBuilder;
  final Function(DocumentReference<T> ref, T snapshot) onSave;

  const PortalInput({
    super.key,
    required this.inputBuilder,
    required this.onSave,
    // required this.q,
    // required this.ref,
    required this.queryDocSnapshot,
  });

  @override
  State<PortalInput<T>> createState() => _PortalInputState<T>();
}

class _PortalInputState<T> extends State<PortalInput<T>> {
  late T _editedData;

  QueryDocumentSnapshot<T> get _queryDocumentSnapshot => widget.queryDocSnapshot;

  @override
  void initState() {
    super.initState();
    _editedData = _queryDocumentSnapshot.data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FilledButton(
            onPressed: () {
              widget.onSave(_queryDocumentSnapshot.reference, _editedData);
              Navigator.pop(context, _editedData);
            },
            child: Text("Save"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(kScreenMargin),
        child: Column(
          children:
              widget.inputBuilder(_editedData).map((e) {
                return e;
              }).toList(),
        ),
      ),
    );
  }
}
