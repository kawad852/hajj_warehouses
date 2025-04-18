import 'package:shared/shared.dart';

class ToolButton extends StatelessWidget {
  final void Function() onTap;
  final String icon;
  final String text;
  const ToolButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 70,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF2F,
          borderRadius: BorderRadius.circular(kRadiusPrimary),
        ),
        child: Row(
          children: [
            CustomSvg(icon, color: context.colorPalette.grey708),
            const SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                color: context.colorPalette.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
