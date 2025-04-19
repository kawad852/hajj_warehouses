import 'package:shared/shared.dart';

class CounterWidget extends StatefulWidget {
  final int initialValue;
  final Function(int value) onChanged;

  const CounterWidget({super.key, required this.initialValue, required this.onChanged});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    if (widget.initialValue != oldWidget.initialValue) {
      // setState(() {
      //   _quantity = widget.initialValue;
      // });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _quantity--;
            });
            widget.onChanged(_quantity);
          },
          icon: const Icon(Icons.remove, size: 30),
        ),
        SizedBox(
          width: 120,
          child: NumbersEditor(
            initialValue: widget.initialValue,
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              color: context.colorPalette.grey708,
              fontSize: 45,
              fontWeight: FontWeight.w800,
            ),
            onChanged: (value) {
              _quantity = value!;
              widget.onChanged(_quantity);
            },
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _quantity++;
            });
            widget.onChanged(_quantity);
          },
          icon: const Icon(Icons.add, size: 30),
        ),
      ],
    );
  }
}
