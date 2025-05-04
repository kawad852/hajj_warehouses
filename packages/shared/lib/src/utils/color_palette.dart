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
  Color get black001 => const Color(0xFF001427);

  //grey
  Color get primary => const Color(0xFF708D81);
  Color get grey780 => const Color(0x80708D81);
  Color get grey74D => const Color(0x4D708D81);
  Color get greyBDB => const Color(0xFFBDBDBD);
  Color get greyDAD => const Color(0xFFDADADA);
  Color get greyF2F => const Color(0xFFF2F2F2);
  Color get greyD9D => const Color(0xFFD9D9D9);
  Color get grey666 => const Color(0xFF666A74);
  Color get greyC4C => const Color(0xFFC4C4C4);
  Color get greyE2E => const Color(0xFFE2E8E6);

  //red
  Color get redC10 => const Color(0xFFC10C01);
  Color get redC33 => const Color(0x33C10C01);
  Color get redFFC => const Color(0xFFFFCAC7);

  //yellow
  Color get yellowC39 => const Color(0xFFC39600);
  Color get yellowC02 => const Color(0xFFDFAC02);
  Color get yellowFFE => const Color(0xFFFFE48A);
  Color get yellow600 => const Color(0xFFC39600);
}
