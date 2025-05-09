import 'package:shared/shared.dart';

class PortalInput<T> extends StatefulWidget {
  final T q;
  final List<Widget> Function(T snapshot) inputBuilder;
  final Function(T snapshot) onSave;

  const PortalInput({super.key, required this.inputBuilder, required this.onSave, required this.q});

  @override
  State<PortalInput<T>> createState() => _PortalInputState<T>();
}

class _PortalInputState<T> extends State<PortalInput<T>> {
  late T _editedData;

  @override
  void initState() {
    super.initState();
    _editedData = widget.q;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FilledButton(
            onPressed: () {
              widget.onSave(_editedData);
              Navigator.pop(context);
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
