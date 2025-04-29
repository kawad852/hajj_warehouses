import 'package:shared/shared.dart';

class TableContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String id;
  final String name;
  final int availableQuantity;
  final int minimumQuantity;
  final String status;

  const TableContainer({
    super.key,
    required this.id,
    required this.onTap,
    required this.availableQuantity,
    required this.minimumQuantity,
    required this.status,
    required this.name,
  });

  (String, Color) _getStatusLabel(BuildContext context) {
    if (status == ItemStatusEnum.outOfStock.value) {
      return ("غير متوفر", context.colorPalette.yellowC02);
    } else if (status == ItemStatusEnum.lowStock.value) {
      return ("بحاحة", context.colorPalette.redC10);
    } else {
      return ("متوفر", context.colorPalette.grey708);
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusInfo = _getStatusLabel(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF2F,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Row(
          children: [
            Expanded(flex: 2, child: TableText(id)),
            Expanded(flex: 14, child: TableText(name)),
            const CustomLine(),
            Expanded(flex: 4, child: TableText("$availableQuantity", textAlign: TextAlign.center)),
            const CustomLine(),
            Expanded(flex: 4, child: TableText("$minimumQuantity", textAlign: TextAlign.center)),
            const CustomLine(),
            Expanded(
              flex: 4,
              child: Container(
                height: 24,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: statusInfo.$2,
                  borderRadius: BorderRadius.circular(kRadiusPrimary),
                ),
                child: AutoSizeText(
                  statusInfo.$1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: context.colorPalette.white, fontWeight: FontWeight.w800),
                  maxLines: 1,
                  maxFontSize: 12,
                  minFontSize: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
