import 'package:shared/shared.dart';

class AddItemWidget extends StatefulWidget {
  final String initialValue;
  final Function(String?) onChanged;
  final Function(int) onQuantityChanged;
  final Widget? removeButton;

  const AddItemWidget({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.onQuantityChanged,
    this.removeButton,
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
        if (widget.removeButton != null) widget.removeButton!,
        Expanded(
          child: TextEditor(
            onChanged: widget.onChanged,
            required: false,
            initialValue: widget.initialValue,
            hintText: "اكتب اسم الصنف",
            hintStyle: TextStyle(
              color: context.colorPalette.grey666,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 100,
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
                    setState(() {
                      _quantity = value!;
                    });
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
