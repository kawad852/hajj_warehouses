import 'package:shared/shared.dart';

class EditorLabel extends StatelessWidget {
  final String label;
  final bool withIndicator;

  const EditorLabel(this.label, {super.key, this.withIndicator = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (withIndicator)
          Text(
            "*",
            style: TextStyle(
              color: context.colorPalette.redC10,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        const SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            color: context.colorPalette.black001,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
