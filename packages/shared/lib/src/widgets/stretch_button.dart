import 'package:shared/shared.dart';

class StretchedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;

  const StretchedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.margin,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          minimumSize: const Size(600, 48),
          backgroundColor: backgroundColor ?? context.colorPalette.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadiusSecondary)),
        ),
        child: child,
      ),
    );
  }
}
