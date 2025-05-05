import 'package:flutter/services.dart';
import 'package:shared/shared.dart';

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
  final String? hintText;
  final TextStyle? hintStyle;
  final bool nullable;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;

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
    this.hintText,
    this.hintStyle,
    this.nullable = false,
    this.inputFormatters,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      initialValue: initialValue,
      hintText: hintText,
      hintStyle: hintStyle,
      required: required,
      textAlign: textAlign,
      enabledBorder: enabledBorder,
      suffixIcon: suffixIcon,
      readOnly: readOnly,
      prefixIcon: prefixIcon,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      minLines: minLines,
      maxLines: maxLines,
      labelText: labelText,
      onChanged: (value) {
        if (nullable && value.isEmpty) {
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
