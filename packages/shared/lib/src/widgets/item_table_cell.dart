import 'package:shared/shared.dart';

class ItemTableCell extends StatelessWidget {
  final String itemName;
  final dynamic Function(int?) onChangedQuntity;
  final bool autoFocus;
  final int length;
  final VoidCallback? onRemove;

  const ItemTableCell({
    super.key,
    required this.itemName,
    required this.onChangedQuntity,
    this.autoFocus = false,
    required this.length,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (length > 1) RemoveButton(onPressed: onRemove),
        Expanded(
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
                const Expanded(flex: 2, child: TableText("25")),
                Expanded(flex: 10, child: TableText(itemName)),
                const CustomLine(),
                Expanded(
                  flex: 6,
                  child: NumbersEditor(
                    initialValue: 1,
                    autofocus: autoFocus,
                    textAlign: TextAlign.center,
                    onChanged: onChangedQuntity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
