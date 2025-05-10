import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  bool manageInitiallyExpanded = false;
  bool buildInitiallyExpanded = false;
  bool engageInitiallyExpanded = false;
  bool configureInitiallyExpanded = false;

  double scrollOffset = 0.0;

  void toggleExpansion(int index, value) {
    switch (index) {
      case 0:
        manageInitiallyExpanded = value;
      case 1:
        buildInitiallyExpanded = value;
      case 2:
        engageInitiallyExpanded = value;
      case 3:
        configureInitiallyExpanded = value;
    }
  }
}
