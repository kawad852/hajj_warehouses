import 'package:shared/shared.dart';

class CustomBack extends StatelessWidget {
  final Color? color;
  const CustomBack({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new_outlined, color: color),
      ),
    );
  }
}
