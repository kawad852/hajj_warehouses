import 'package:shared/object_box_exports.dart';
import 'package:shared/shared.dart';

class PolicyBuilder extends StatefulWidget {
  final String? content;
  final Function(String text) onChanged;

  const PolicyBuilder({super.key, required this.onChanged, required this.content});

  @override
  State<PolicyBuilder> createState() => _PolicyBuilderState();
}

class _PolicyBuilderState extends State<PolicyBuilder> with AutomaticKeepAliveClientMixin {
  late QuillController _quillCtrl;

  String _convertToHtml() {
    final deltaJson = _quillCtrl.document.toDelta().toJson();
    return QuillDeltaToHtmlConverter(List.castFrom(deltaJson)).convert();
  }

  @override
  void initState() {
    _quillCtrl = QuillController(
      document: Document.fromDelta(HtmlToDelta().convert(widget.content ?? "-")),
      selection: const TextSelection.collapsed(offset: 0),
    );
    _quillCtrl.addListener(() {
      final text = _convertToHtml();
      widget.onChanged(text);
    });
    super.initState();
  }

  @override
  void dispose() {
    _quillCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(kScreenMargin),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              QuillSimpleToolbar(
                controller: _quillCtrl,
                config: const QuillSimpleToolbarConfig(showCodeBlock: false),
              ),
              const SizedBox(height: 10),
              QuillEditor.basic(
                controller: _quillCtrl,
                config: const QuillEditorConfig(minHeight: 300),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
