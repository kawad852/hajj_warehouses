import 'package:flutter/material.dart';

class ColorPalette {
  final BuildContext _context;

  ColorPalette(this._context);

  static of(BuildContext context) => ColorPalette(context);

  bool get _isLightTheme => true;

  ///common
  Color get white => Colors.white;
  Color get black => Colors.black;

  //black
  Color get black001 =>  const Color(0xFF001427);
  

  //grey
  Color get grey708 =>  const Color(0xFF708D81);
  Color get greyBDB =>  const Color(0xFFBDBDBD);
}
