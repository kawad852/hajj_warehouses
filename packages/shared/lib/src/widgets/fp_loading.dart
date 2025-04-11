import 'package:flutter/material.dart';

import 'base_loader.dart';

class FPLoading extends StatelessWidget {
  const FPLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: BaseLoader());
  }
}
