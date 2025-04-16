import 'package:flutter/material.dart';

import '../../helper/validation_helper.dart';
import 'base_editor.dart';

class NumbersEditor extends StatelessWidget {
  final int? initialValue;
  final Function(int?) onChanged;
  final bool required;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final InputBorder? enabledBorder;
  final TextAlign? textAlign;
  final String? hintText;

  const NumbersEditor({
    super.key,
    this.initialValue,
    required this.onChanged,
    this.required = true,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText,
    this.keyboardType,
    this.maxLines,
    this.enabledBorder,
    this.textAlign,
    this.minLines,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      labelText: labelText,
      hintText: hintText,
      required: required,
      initialValue: initialValue?.toString(),
      onChanged: (value) {
        if (value.isEmpty) {
          onChanged(null);
        } else if (ValidationHelper.intNumberRegex.hasMatch(value)) {
          onChanged(int.parse(value));
        }
      },
      // validator: (value) {
      //   if (required && (value == null || value.isEmpty)) {
      //     return null;
      //   }
      //   return ValidationHelper.numberInt(context, value);
      // },
    );
  }
}
