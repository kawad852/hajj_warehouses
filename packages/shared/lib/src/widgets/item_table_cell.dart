import 'package:shared/shared.dart';

class ItemTableCell extends StatelessWidget {
  final String itemName;
  final dynamic Function(int?) onChangedQuntity;
  const ItemTableCell({
    super.key,
    required this.itemName,
    required this.onChangedQuntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF2F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Row(
        children: [
          const Expanded(flex: 2, child: TableText("25")),
          Expanded(flex: 10, child: TableText(itemName)),
          const CustomLine(),
          Expanded(
            flex: 6,
            child: NumbersEditor(
              textAlign: TextAlign.center,
              hintText: "00",
              onChanged: onChangedQuntity,
            ),
          ),
        ],
      ),
    );
  }
}
