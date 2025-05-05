import 'package:shared/shared.dart';

class AddItemWidget extends StatefulWidget {
  final String initialValue;
  final Function(String?) onChanged;
  final VoidCallback? onRemove;
  final bool showRemove;
  final Function(int) onQuantityChanged;

  const AddItemWidget({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.onQuantityChanged,
    required this.onRemove,
    required this.showRemove,
  });

  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.showRemove) RemoveButton(onPressed: widget.onRemove),
        Expanded(
          child: TextEditor(
            onChanged: widget.onChanged,
            required: false,
            initialValue: widget.initialValue,
            hintText: context.appLocalization.writeTheItemName,
            hintStyle: TextStyle(
              color: context.colorPalette.grey666,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 120,
          height: 48,
          decoration: BoxDecoration(
            color: context.colorPalette.greyF2F,
            borderRadius: BorderRadius.circular(kRadiusSecondary),
          ),
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed:
                      _quantity > 1
                          ? () {
                            setState(() {
                              _quantity--;
                            });
                            widget.onQuantityChanged(_quantity);
                          }
                          : null,
                  icon: const Icon(Icons.remove, size: 20),
                ),
              ),
              Expanded(
                child: NumbersEditor(
                  key: ValueKey(_quantity),
                  initialValue: _quantity,
                  onChanged: (value) {
                    // setState(() {
                    _quantity = value!;
                    // });
                    widget.onQuantityChanged(_quantity);
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                    widget.onQuantityChanged(_quantity);
                  },
                  icon: const Icon(Icons.add, size: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
