import 'package:shared/shared.dart';

class ManageButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final TextAlign? textAlign;
  final double? width;
  final double? iconWidth;
  final String? icon;
  const ManageButton({
    super.key,
    required this.title,
    this.backgroundColor,
    this.textColor,
    this.textAlign,
    this.width,
    this.icon,
    this.onTap,
    this.iconWidth,
    this.iconColor = const Color(0xFF708D81),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: backgroundColor ?? context.colorPalette.greyF2F,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Row(
          children: [
            if (icon != null)
              CustomSvg(icon!, width: iconWidth, color: iconColor),
            if (icon != null) const SizedBox(width: 4),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: textAlign,
                maxLines: 2,
                style: TextStyle(
                  color: textColor ?? context.colorPalette.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
