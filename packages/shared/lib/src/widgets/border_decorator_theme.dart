import 'package:shared/shared.dart';

class BorderDecoratorTheme extends StatelessWidget {
  final Widget child;

  const BorderDecoratorTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: context.colorPalette.primary),
      borderRadius: BorderRadius.circular(kRadiusSecondary),
    );
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          filled: false,
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: border,
          focusedErrorBorder: border.copyWith(
            borderSide: BorderSide(color: context.colorScheme.error),
          ),
        ),
      ),
      child: child,
    );
  }
}
