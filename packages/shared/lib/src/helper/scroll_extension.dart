import 'package:flutter/material.dart';

extension ScrollExtension on BuildContext {
  Future<void> scroll() async {
    await Scrollable.ensureVisible(
      this,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
