import 'package:flutter/services.dart';

import '../../../shared.dart';

class UsernameEditor extends StatelessWidget {
  final String? initialValue;
  final Function(String?) onChanged;
  final bool readOnly;

  const UsernameEditor({
    super.key,
    this.initialValue,
    required this.onChanged,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextEditor(
      initialValue: initialValue,
      onChanged: onChanged,
      readOnly: readOnly,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9_]*$'))],
      prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.user)),
    );
  }
}
