import 'package:flutter/material.dart';

class BaseSearchBar extends StatelessWidget {
  const BaseSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: WidgetStateProperty.all(0),
      hintText: "What are you looking for?",
    );
  }
}
