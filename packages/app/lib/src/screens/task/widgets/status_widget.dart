import 'package:shared/shared.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontFamily: GoogleFonts.cairo().fontFamily!,
      color: context.colorPalette.grey666,
      fontSize: 14,
      fontWeight: FontWeight.w800,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: style,
          children: [
            const WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 10, end: 7),
                child: CustomSvg(MyIcons.greyRect),
              ),
            ),
            TextSpan(text: context.appLocalization.currentlyInProgress, style: style),
            const WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 10, end: 7),
                child: CustomSvg(MyIcons.redRect),
              ),
            ),
            TextSpan(text: context.appLocalization.overdue, style: style),
            const WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 10, end: 7),
                child: CustomSvg(MyIcons.yellowRect),
              ),
            ),
            TextSpan(text: context.appLocalization.notCompleted, style: style),
            const WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: 7),
                child: CustomSvg(MyIcons.rect),
              ),
            ),
            TextSpan(text: context.appLocalization.completed, style: style),
          ],
        ),
      ),
    );
  }
}
