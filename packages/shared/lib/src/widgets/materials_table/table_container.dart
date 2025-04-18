import 'package:app/screens_exports.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class TableContainer extends StatefulWidget {
  const TableContainer({super.key});

  @override
  State<TableContainer> createState() => _TableContainerState();
}

class _TableContainerState extends State<TableContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push((context) => const ItemManagementScreen());
      },
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
            const Expanded(flex: 2, child: TableText("45")),
            const Expanded(flex: 14, child: TableText("ارز حبة طويلة ( 10 كغ )")),
            const CustomLine(),
            const Expanded(flex: 4, child: TableText("91", textAlign: TextAlign.center)),
            const CustomLine(),
            const Expanded(flex: 4, child: TableText("100", textAlign: TextAlign.center)),
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
                  "بحاجة",
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
