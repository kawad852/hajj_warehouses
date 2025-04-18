import 'package:shared/shared.dart';

class BottomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const BottomButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: StretchedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: context.colorPalette.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
