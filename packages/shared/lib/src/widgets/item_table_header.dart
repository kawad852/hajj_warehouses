import 'package:shared/shared.dart';

class ItemTableHeader extends StatelessWidget {
  const ItemTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      margin: const EdgeInsets.only(top: 10, bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.grey74D,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Row(
        children: [
          const Expanded(flex: 2, child: TableText("#")),
          Expanded(flex: 10, child: TableText(context.appLocalization.itemName)),
          const CustomLine(),
          Expanded(
            flex: 6,
            child: TableText(context.appLocalization.quantityRequired, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
