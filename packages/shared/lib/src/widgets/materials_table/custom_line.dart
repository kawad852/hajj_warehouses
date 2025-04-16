import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return  VerticalDivider(color: context.colorPalette.black, thickness: 0.5);
  }
}