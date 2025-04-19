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

  @override
  Widget build(BuildContext context) {
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
                  color: context.colorPalette.redC10,
                  borderRadius: BorderRadius.circular(kRadiusPrimary),
                ),
                child: Text(
                  status,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
