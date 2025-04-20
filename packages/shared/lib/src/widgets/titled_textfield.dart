import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class TitledTextField extends StatelessWidget {
  final String title;
  final Widget child;
  final bool required;
  final TextStyle? textStyle;

  const TitledTextField({
    super.key,
    required this.title,
    required this.child,
    this.required = true,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyle ?? context.textTheme.bodySmall!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: context.colorPalette.black001,
          ),
        ),
        const SizedBox(height: 3),
        child,
        const SizedBox(height: 3),
      ],
    );
  }
}
