import 'package:shared/shared.dart';

class DateWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function() onTap;
  const DateWidget({super.key, required this.title, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 6),
        margin: const EdgeInsetsDirectional.only(end: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? context.colorPalette.primary : context.colorPalette.greyC4C,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? context.colorPalette.primary : context.colorPalette.greyC4C,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
