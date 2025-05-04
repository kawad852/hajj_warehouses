import 'package:shared/shared.dart';

class ProcessTimeLine extends StatelessWidget {
  final Widget? Function(BuildContext, int)? contentsBuilder;
  final int itemCount;
  const ProcessTimeLine({super.key, this.contentsBuilder, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineTheme.of(context).copyWith(
        nodePosition: 0,
        connectorTheme: ConnectorThemeData(color: context.colorPalette.primary),
        indicatorTheme: IndicatorThemeData(color: context.colorPalette.primary),
      ),

      builder: TimelineTileBuilder.connected(
        itemCount: itemCount,

        connectorBuilder: (context, index, type) {
          return SolidLineConnector(color: context.colorPalette.primary);
        },
        indicatorBuilder: (context, index) {
          return DotIndicator(color: context.colorPalette.primary, size: 20);
        },
        contentsBuilder: contentsBuilder,
      ),
    );
  }
}
