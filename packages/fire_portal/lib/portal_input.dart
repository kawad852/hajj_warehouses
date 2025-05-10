import 'package:shared/shared.dart';

class PortalInput<T> extends StatefulWidget {
  final List<Widget> Function(T snapshot) inputBuilder;
  final Future<void> Function(DocumentReference<T>? ref, T snapshot) onSave;
  final T data;
  final DocumentReference<T>? reference;
  // final Map<String, dynamic>? jsonData;

  const PortalInput({
    super.key,
    required this.inputBuilder,
    required this.onSave,
    // required this.queryDocSnapshot,
    required this.data,
    required this.reference,
    // this.jsonData,
  });

  @override
  State<PortalInput<T>> createState() => _PortalInputState<T>();
}

class _PortalInputState<T> extends State<PortalInput<T>> {
  late T _editedData;
  final _formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      ApiService.fetch(
        context,
        callBack: () async {
          await widget.onSave(widget.reference, _editedData);
          if (context.mounted) {
            context.showSnackBar(context.appLocalization.successfullyUpdated);
            Navigator.pop(context, _editedData);
          }
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _editedData = widget.data!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FilledButton(
            onPressed: () {
              _onSubmit(context);
            },
            child: Text(context.appLocalization.save),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(kScreenMargin),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children:
                  widget.inputBuilder(_editedData).map((e) {
                    return e;
                  }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
