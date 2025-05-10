import 'package:shared/shared.dart';

class AppBarText extends StatelessWidget {
  final String data;
  final Color? color;
  const AppBarText(this.data, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color ?? context.colorPalette.black001,
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
