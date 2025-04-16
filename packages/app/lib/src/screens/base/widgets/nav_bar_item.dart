
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class NavBarItem extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String icon;
  final double? width;

  const NavBarItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.icon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: CustomSvg(
              icon,
              // height: 25,
              width: width,
            ),
          ),
        ),
      ),
    );
  }
}
