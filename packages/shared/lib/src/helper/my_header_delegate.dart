import 'package:flutter/material.dart';

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight, collapsedHeight;

  final Function(
    BuildContext context,
    double shrinkOffset,
    double expandedHeight,
    double collapsedHeight,
    double appearPercent,
    double disappearPercent,
  ) builder;

  MyHeaderDelegate({
    required this.builder,
    required this.expandedHeight,
    required this.collapsedHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(
      context,
      shrinkOffset,
      expandedHeight,
      collapsedHeight,
      appear(shrinkOffset),
      disappear(shrinkOffset),
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => collapsedHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
