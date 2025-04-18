import 'package:app/screens_exports.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class TableContainer extends StatelessWidget {
  final List<String> items;

  const TableContainer({super.key, required this.items});

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
            Expanded(flex: 2, child: TableText(items[0])),
            Expanded(flex: 14, child: TableText(items[1])),
            const CustomLine(),
            Expanded(flex: 4, child: TableText(items[2], textAlign: TextAlign.center)),
            const CustomLine(),
            Expanded(flex: 4, child: TableText(items[3], textAlign: TextAlign.center)),
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
                  items[4],
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
