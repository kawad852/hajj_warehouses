import 'package:shared/shared.dart';

class MaterialsTable extends StatelessWidget {
  const MaterialsTable({super.key});

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
          Expanded(flex: 14, child: TableText(context.appLocalization.itemName)),
          const CustomLine(),
          Expanded(flex: 4, child: TableText(context.appLocalization.available, textAlign: TextAlign.center)),
          const CustomLine(),
          Expanded(flex: 4, child: TableText(context.appLocalization.limit, textAlign: TextAlign.center)),
          const CustomLine(),
          Expanded(flex: 4, child: TableText(context.appLocalization.status, textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}
