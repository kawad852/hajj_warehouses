import 'package:shared/shared.dart';

class CustomBack extends StatelessWidget {
  const CustomBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
