import 'package:shared/shared.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.remove, size: 30)),
        SizedBox(
          width: 100,
          child: NumbersEditor(
            initialValue: 0,
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              color: context.colorPalette.grey708,
              fontSize: 45,
              fontWeight: FontWeight.w800,
            ),
            onChanged: (value) {},
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.add, size: 30)),
      ],
    );
  }
}
