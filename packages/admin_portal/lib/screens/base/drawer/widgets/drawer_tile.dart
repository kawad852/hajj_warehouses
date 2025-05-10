import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool selected;

  const DrawerTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      selected: selected,
      contentPadding: const EdgeInsetsDirectional.only(start: 40),
      title: Text(title),
    );
  }
}
