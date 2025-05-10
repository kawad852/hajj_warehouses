import 'package:shared/shared.dart';

class RailExpansionTile extends StatefulWidget {
  final String title;
  final Widget child;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry padding;
  final IconData iconData;
  final int index;

  const RailExpansionTile({
    super.key,
    required this.child,
    required this.title,
    required this.initiallyExpanded,
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    required this.iconData,
    required this.index,
  });

  @override
  State<RailExpansionTile> createState() => _RailExpansionTileState();
}

class _RailExpansionTileState extends State<RailExpansionTile>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool get _initiallyExpanded => widget.initiallyExpanded;

  void toggleExpansion() {
    _controller.value == 1 ? _controller.reverse() : _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 250), vsync: this)
      ..addListener(() {
        setState(() {});
      });
    _controller.value = _initiallyExpanded ? 1 : 0;
    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: widget.padding,
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
                listTileTheme: ListTileThemeData(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
              child: ExpansionTile(
                initiallyExpanded: _initiallyExpanded,
                onExpansionChanged: (value) {
                  context.drawerProvider.toggleExpansion(widget.index, value);
                  toggleExpansion();
                },
                leading: Icon(widget.iconData, size: 18),
                title: Text(
                  widget.title,
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    // color: _fullyExpanded ? context.colorScheme.primary : null,
                  ),
                ),
                trailing: RotationTransition(
                  turns: Tween(begin: 0.0, end: context.isRTL ? -0.5 : 0.5).animate(_controller),
                  child: const Icon(Icons.keyboard_arrow_down_rounded, size: 20),
                ),
              ),
            ),
            SizeTransition(axisAlignment: 1.0, sizeFactor: _animation, child: widget.child),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
