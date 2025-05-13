import 'package:flutter/services.dart';

import '../../../shared.dart';

class UsernameEditor extends StatelessWidget {
  final String? initialValue;
  final Function(String?) onChanged;

  const UsernameEditor({super.key, this.initialValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextEditor(
      initialValue: initialValue,
      onChanged: onChanged,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9_]*$'))],
      prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.user)),
    );
  }
}
