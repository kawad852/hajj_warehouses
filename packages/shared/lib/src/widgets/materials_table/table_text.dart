import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class TableText extends StatelessWidget {
  final String data;
  final TextAlign? textAlign;

  const TableText(this.data, {super.key, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: context.colorPalette.black,
        fontSize: 14,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
