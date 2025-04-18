import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: context.colorPalette.yellowC39,
        borderRadius: BorderRadius.circular(kRadiusPrimary),
      ),
      child: Text(
        "بالإنتظار",
        style: TextStyle(
          color: context.colorPalette.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
