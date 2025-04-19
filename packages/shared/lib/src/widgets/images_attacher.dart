import 'package:shared/shared.dart';

class ImagesAttacher extends StatelessWidget {
  final void Function() onTap;
  final String title;
  const ImagesAttacher({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: context.colorPalette.grey708),
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Row(
          children: [
            const CustomSvg(MyIcons.attachCircle),
            const SizedBox(width: 10),
            Text(
              "*",
              style: TextStyle(
                color: context.colorPalette.redC10,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: context.colorPalette.black001,
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
