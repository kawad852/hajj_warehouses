import 'package:shared/object_box_exports.dart';
import 'package:shared/shared.dart';

class CalenderCard extends StatelessWidget {
  final bool selected;
  final void Function() onTap;
  final DateTime date;

  const CalenderCard({super.key, required this.selected, required this.onTap, required this.date});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 43,
        height: 52,
        decoration: BoxDecoration(
          color: selected ? context.colorPalette.primary : context.colorPalette.greyF2F,
          borderRadius: BorderRadius.circular(kRadiusPrimary),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${date.day}",
              style: TextStyle(
                color: selected ? context.colorPalette.white : context.colorPalette.black001,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: AutoSizeText(
                DateFormat('EEEE', context.languageCode).format(date),
                style: TextStyle(
                  color: selected ? context.colorPalette.white : context.colorPalette.black001,
                  fontWeight: FontWeight.w800,
                ),
                minFontSize: 8,
                maxFontSize: 12,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
