import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ItemTableCell extends StatelessWidget {
  const ItemTableCell({super.key});

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
      child: const Row(
        children: [
          Expanded(flex: 2, child: TableText("25")),
          Expanded(flex: 10, child: TableText("طماطم صناديق")),
          CustomLine(),
          Expanded(
            flex: 6,
            child: TableText("00", textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
