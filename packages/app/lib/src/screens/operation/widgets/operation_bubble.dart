import 'package:shared/shared.dart';

class OperationBubble extends StatelessWidget {
  final String title, value;
  const OperationBubble({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF2F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Text(
        "$title: $value",
        style: TextStyle(
          color: context.colorPalette.black001,
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
