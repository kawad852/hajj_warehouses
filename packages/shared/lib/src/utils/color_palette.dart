import 'package:flutter/material.dart';

class ColorPalette {
  final BuildContext _context;

  ColorPalette(this._context);

  static of(BuildContext context) => ColorPalette(context);

  bool get _isLightTheme => true;

  Color get grey7ED => _isLightTheme ? const Color(0xFFE4E7ED) : const Color(0xFFE4E7ED);
}
