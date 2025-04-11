import 'package:flutter/material.dart';

import 'my_search_anchor.dart';

class FireAnimatedSearchBar extends StatelessWidget {
  final Function(String) onChanged;
  final Widget Function(BuildContext context, String query) resultsBuilder;
  final String hintText;
  final bool isFullScreen;
  final Widget Function(BuildContext, MySearchController) builder;

  const FireAnimatedSearchBar({
    super.key,
    required this.onChanged,
    required this.resultsBuilder,
    required this.hintText,
    this.isFullScreen = true,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return MySearchAnchor(
      viewHintText: hintText,
      isFullScreen: isFullScreen,
      viewTrailing: const [],
      viewConstraints: const BoxConstraints(maxWidth: 600),
      viewOnChanged: onChanged,
      builder: builder,
      resultsBuilder: resultsBuilder,
    );
  }
}
