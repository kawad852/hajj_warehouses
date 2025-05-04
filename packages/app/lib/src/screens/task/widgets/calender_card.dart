import 'package:shared/shared.dart';

class CalenderCard extends StatelessWidget {
  final int dateIndex;
  final int currentIndex;
  final void Function() onTap;
  const CalenderCard({
    super.key,
    required this.dateIndex,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 43,
        height: 52,
        decoration: BoxDecoration(
          color:
              dateIndex == currentIndex
                  ? context.colorPalette.primary
                  : context.colorPalette.greyF2F,
          borderRadius: BorderRadius.circular(kRadiusPrimary),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "28",
              style: TextStyle(
                color:
                    dateIndex == currentIndex
                        ? context.colorPalette.white
                        : context.colorPalette.black001,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "الأحد",
              style: TextStyle(
                color:
                    dateIndex == currentIndex
                        ? context.colorPalette.white
                        : context.colorPalette.black001,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
