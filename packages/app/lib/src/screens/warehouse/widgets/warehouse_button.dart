import 'package:shared/shared.dart';

class WarehouseButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final int flex;
  final Color? backgroundColor;
  final String icon;
  final String? value;
  const WarehouseButton({
    super.key,
    required this.onTap,
    this.flex = 1,
    this.backgroundColor,
    required this.icon,
    this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: backgroundColor ?? context.colorPalette.greyF2F,
            borderRadius: BorderRadius.circular(kRadiusSecondary),
          ),
          child: Row(
            children: [
              CustomSvg(icon),
              const SizedBox(width: 5),
              if (value != null)
                Text(
                  value!,
                  style: TextStyle(
                    color: context.colorPalette.redC10,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
