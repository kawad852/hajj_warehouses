import '../../../shared.dart';

class DecimalsEditor extends StatelessWidget {
  final double? initialValue;
  final Function(double?) onChanged;
  final String? suffixText;
  final bool required;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextAlign? textAlign;
  final bool nullable;
  final Widget? suffixIcon;

  const DecimalsEditor({
    super.key,
    this.initialValue,
    required this.onChanged,
    this.suffixText,
    this.required = true,
    this.readOnly = false,
    this.onTap,
    this.textAlign,
    this.nullable = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      required: required,
      textAlign: textAlign,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onTap: onTap,
      inputFormatters: [ArabicDigitConverterFormatter(digitsOnly: false)],
      readOnly: readOnly,
      suffixText: suffixText,
      suffixIcon: suffixIcon,
      initialValue: initialValue?.toString(),
      onChanged: (value) {
        if (nullable && value.isEmpty) {
          onChanged(null);
        } else if (ValidationHelper.decimalNumbersRegex.hasMatch(value)) {
          onChanged(double.parse(value));
        }
      },
      validator: (value) {
        if (!required && (value == null || value.isEmpty)) {
          return null;
        }
        return ValidationHelper.numbers(context, value);
      },
    );
  }
}
