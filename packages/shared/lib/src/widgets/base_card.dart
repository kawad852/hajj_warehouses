import 'package:shared/shared.dart';

class BaseCard extends StatelessWidget {
  final String displayName;
  final String action1, action2;
  final DateTime date;

  const BaseCard({
    super.key,
    required this.displayName,
    required this.action1,
    required this.action2,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: context.colorPalette.black001,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.cairo().fontFamily!,
    );
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin: const EdgeInsetsDirectional.only(bottom: 5, start: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF2F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: style,
              children: [
                const TextSpan(text: "قام"),
                TextSpan(
                  text: " $displayName ",
                  style: style.copyWith(color: context.colorPalette.primary),
                ),
                TextSpan(text: "بـ $action1 "),
                TextSpan(text: action2),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              context.defaultDateFormat(date),
              style: TextStyle(
                color: context.colorPalette.grey666,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
