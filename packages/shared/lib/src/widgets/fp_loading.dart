import 'package:flutter/material.dart';

import 'base_loader.dart';

class FPLoading extends StatelessWidget {
  const FPLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.symmetric(vertical: 20), child: BaseLoader());
  }
}
