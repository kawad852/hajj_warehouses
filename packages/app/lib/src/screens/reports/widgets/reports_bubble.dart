import 'package:shared/shared.dart';

class ReportsBubble extends StatelessWidget {
  final String title;
  final String value;
  final Color? backgroungColor;
  final Color? textColor;
  final int flex;
  final bool isWallet;
  const ReportsBubble({
    super.key,
    required this.title,
    required this.value,
    this.backgroungColor,
    this.textColor,
    this.flex = 1,
    this.isWallet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        width: double.infinity,
        height: 73,
        decoration: BoxDecoration(
          color: backgroungColor ?? context.colorPalette.greyF2F,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor ?? context.colorPalette.black001,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: textColor ?? context.colorPalette.black001,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (isWallet) const SizedBox(width: 5),
                if (isWallet) const CustomSvg(MyIcons.currency),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
