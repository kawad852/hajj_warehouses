import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helper/validation_helper.dart';
import 'base_editor.dart';

class NumbersEditor extends StatelessWidget {
  final int? initialValue;
  final TextEditingController? controller;
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
  final bool nullable;

  const NumbersEditor({
    super.key,
    this.controller,
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
    this.nullable = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      labelText: labelText,
      controller: controller,
      hintText: hintText,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      required: required,
      initialValue: initialValue?.toString(),
      onChanged: (value) {
        if (nullable && value.isEmpty) {
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
