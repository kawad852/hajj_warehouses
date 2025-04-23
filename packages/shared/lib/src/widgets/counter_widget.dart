import 'package:shared/shared.dart';

class CounterWidget extends StatefulWidget {
  final int? maxQuantity;
  final Function(int value) onChanged;

  const CounterWidget({super.key, required this.maxQuantity, required this.onChanged});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  var _quantity = 1;

  bool get _canAddMore =>
      widget.maxQuantity == null ||
      (widget.maxQuantity != null && _quantity <= widget.maxQuantity! - 1);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed:
              _quantity > 1
                  ? () {
                    setState(() {
                      _quantity--;
                    });
                    widget.onChanged(_quantity);
                  }
                  : null,
          icon: const Icon(Icons.remove, size: 30),
        ),
        SizedBox(
          width: 120,
          child: NumbersEditor(
            key: ValueKey(_quantity),
            initialValue: _quantity,
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
          onPressed:
              _canAddMore
                  ? () {
                    setState(() {
                      _quantity++;
                    });
                    widget.onChanged(_quantity);
                  }
                  : null,
          icon: const Icon(Icons.add, size: 30),
        ),
      ],
    );
  }
}
