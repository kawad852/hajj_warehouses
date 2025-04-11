import 'package:flutter/material.dart';

class StretchedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;

  const StretchedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final height = Theme.of(context).buttonTheme.height + 4;
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Center(
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            minimumSize: Size(300, height),
            maximumSize: Size(600, height),
          ),
          child: child,
        ),
      ),
    );
  }
}
