import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ProcessTimeLine extends StatelessWidget {
  final Widget? Function(BuildContext, int)? contentsBuilder;
  final int itemCount;
  const ProcessTimeLine({
    super.key,
    this.contentsBuilder,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineTheme.of(context).copyWith(
        nodePosition: 0,
        connectorTheme: ConnectorThemeData(color: context.colorPalette.grey708),
        indicatorTheme: IndicatorThemeData(color: context.colorPalette.grey708),
      ),
      builder: TimelineTileBuilder.connected(
        itemCount: itemCount,
        connectorBuilder: (context, index, type) {
          return SolidLineConnector(color: context.colorPalette.grey708);
        },
        indicatorBuilder: (context, index) {
          return DotIndicator(color: context.colorPalette.grey708, size: 20);
        },
        contentsBuilder: contentsBuilder,
      ),
    );
  }
}
