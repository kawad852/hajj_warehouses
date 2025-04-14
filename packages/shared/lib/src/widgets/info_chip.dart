import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class InfoChip extends StatelessWidget {
  final IconData icon;
  final String labelText;

  const InfoChip({super.key, required this.icon, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(kRadiusPrimary),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14),
          const SizedBox(width: 4),
          Text(labelText, style: context.textTheme.labelSmall),
        ],
      ),
    );
  }
}
