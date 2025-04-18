import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class AppBarText extends StatelessWidget {
  final String data;
  const AppBarText(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: context.colorPalette.black001,
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
