import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../helper/validation_helper.dart';
import 'base_editor.dart';

class TextEditor extends StatelessWidget {
  final String? initialValue;
  final Function(String?) onChanged;
  final bool required;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final InputBorder? enabledBorder;
  final TextAlign? textAlign;

  const TextEditor({
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
  });

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      initialValue: initialValue,
      required: required,
      textAlign: textAlign,
      enabledBorder: enabledBorder ?? const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent)
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      labelText: labelText,
      style: TextStyle(color: context.colorPalette.greyBDB,fontWeight: FontWeight.bold),
      onChanged: (value) {
        if (value.isEmpty) {
          onChanged(null);
        } else {
          onChanged(value);
        }
      },
      validator: (value) {
        if (!required && (value == null || value.isEmpty)) {
          return null;
        }
        return ValidationHelper.general(context, value);
      },
    );
  }
}
