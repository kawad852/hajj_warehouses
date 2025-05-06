import 'package:shared/shared.dart';

class ToggleButtonChild extends StatelessWidget {
  final String? icon;
  final String title;

  const ToggleButtonChild({super.key, this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) CustomSvg(icon!),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 6), child: Text(title)),
      ],
    );
  }
}
