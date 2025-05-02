import 'package:shared/shared.dart';

class NavEditor extends StatelessWidget {
  final String? labelText;
  final String? icon;
  final Widget? prefixIcon, suffixIcon;
  final String? value;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;
  final bool required;
  final String? initialValue;
  final double maxWidth;

  const NavEditor({
    super.key,
    this.labelText,
    this.prefixIcon,
    this.value,
    required this.onTap,
    this.suffixIcon,
    this.padding,
    this.validator,
    this.icon,
    this.required = true,
    this.initialValue,
    this.maxWidth = 50,
  });

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      key: ValueKey(value),
      prefixIcon: prefixIcon,
      suffixIcon: Center(child: suffixIcon),
      required: required,
      suffixIconConstraints: BoxConstraints(maxWidth: maxWidth),
      controller: TextEditingController(text: value),
      labelText: labelText,
      readOnly: true,
      canRequestFocus: false,
      onTap: onTap,
      validator: validator,
    );
  }
}
