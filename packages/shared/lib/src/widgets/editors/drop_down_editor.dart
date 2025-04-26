import 'package:flutter/material.dart';
import 'package:shared/src/extensions/base_extension.dart';
import 'package:shared/src/helper/translation_extension.dart';

import '../../utils/my_theme.dart';

class DropDownEditor<T> extends StatelessWidget {
  final T? value;
  final Function(T?)? onChanged;
  final String title;
  final List<DropdownMenuItem<T>> items;
  final EdgeInsetsGeometry? padding;

  const DropDownEditor({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.items,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kMaxWidth),
        child: DropdownButtonFormField(
          onChanged: onChanged,
          value: value,

          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: title,
            labelStyle: TextStyle(
              color: context.colorPalette.grey666,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          validator: (value) {
            if (value == null) {
              return context.appLocalization.requiredField;
            }
            return null;
          },
          items: items,
        ),
      ),
    );
  }
}
