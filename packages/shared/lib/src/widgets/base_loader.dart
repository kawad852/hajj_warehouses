import 'package:flutter/material.dart';

class BaseLoader extends StatelessWidget {
  const BaseLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
