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
  final TextStyle? textStyle;
  final bool autofocus;

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
    this.textStyle,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      labelText: labelText,
      controller: controller,
      hintText: hintText,
      textAlign: textAlign,
      style: textStyle,
      autofocus: autofocus,
      suffixIcon: suffixIcon,
      suffixIconConstraints: const BoxConstraints(maxWidth: 60),
      keyboardType: TextInputType.number,
      inputFormatters: [ArabicDigitConverterFormatter(digitsOnly: true)],
      required: required,
      initialValue: initialValue?.toString(),
      onChanged: (value) {
        if (nullable && value.isEmpty) {
          onChanged(null);
        } else if (ValidationHelper.intNumberRegex.hasMatch(value)) {
          onChanged(int.parse(value));
        }
      },
      validator: (value) {
        if (required && (value == null || value.isEmpty)) {
          return null;
        }
        return ValidationHelper.numberInt(context, value);
      },
    );
  }
}

class ArabicDigitConverterFormatter extends TextInputFormatter {
  final bool digitsOnly;

  ArabicDigitConverterFormatter({this.digitsOnly = false});

  static final _arabicToEnglishMap = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final buffer = StringBuffer();
    bool dotAlreadyExists = false;

    for (final char in newValue.text.characters) {
      final converted = _arabicToEnglishMap[char] ?? char;

      if (RegExp(r'[0-9]').hasMatch(converted)) {
        buffer.write(converted);
      } else if (!digitsOnly && converted == '.' && !dotAlreadyExists) {
        buffer.write('.');
        dotAlreadyExists = true;
      }
      // Ignore all other characters
    }

    final newText = buffer.toString();

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
