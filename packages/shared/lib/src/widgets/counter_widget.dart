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
  late TextEditingController _quantityCtrl;

  int? get _maxQuantity => widget.maxQuantity;
  bool get _canAddMore =>
      _maxQuantity == null || (_maxQuantity != null && _quantity <= _maxQuantity! - 1);

  @override
  void initState() {
    super.initState();
    _quantityCtrl = TextEditingController(text: _quantity.toString());
  }

  @override
  void dispose() {
    _quantityCtrl.dispose();
    super.dispose();
  }

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
                      _quantityCtrl.text = _quantity.toString();
                    });
                    widget.onChanged(_quantity);
                  }
                  : null,
          icon: const Icon(Icons.remove, size: 30),
        ),
        SizedBox(
          width: 150,
          child: NumbersEditor(
            controller: _quantityCtrl,
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              color: context.colorPalette.primary,
              fontSize: 45,
              fontWeight: FontWeight.w800,
            ),
            onChanged: (value) {
              if (_maxQuantity != null && value! > _maxQuantity!) {
                Fluttertoast.showToast(msg: "الحد الأقصى للصنف $_maxQuantity");
                _quantityCtrl.clear();
                setState(() {
                  final value = _maxQuantity ?? _quantity;
                  _quantityCtrl.text = '$value';
                  _quantity = value;
                  widget.onChanged(_quantity);
                });
                return;
              }
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
                      _quantityCtrl.text = _quantity.toString();
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
