import 'package:shared/shared.dart';

class OperationInputScreen extends StatefulWidget {
  final int availableQuantity;
  final OperationType operationType;

  const OperationInputScreen({
    super.key,
    required this.availableQuantity,
    required this.operationType,
  });

  @override
  State<OperationInputScreen> createState() => _OperationInputScreenState();
}

class _OperationInputScreenState extends State<OperationInputScreen> {
  int? _groupValue = 1;
  late InventoryOperationModel _operation;

  OperationType get _operationType => widget.operationType;

  @override
  void initState() {
    super.initState();
    _operation = InventoryOperationModel(
      operationType: _operationType.value,
      displayName: MySharedPreferences.user!.displayName!,
      supplyType: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final info = _operationType.getInfo(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomButton(text: "اضافة", onPressed: () {}),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              info.title,
              style: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            CounterWidget(initialValue: widget.availableQuantity, onChanged: (value) {}),
            if (info.radio.items.isNotEmpty) ...[
              EditorLabel(info.radio.label),
              const SizedBox(height: 8),
              Row(
                children:
                    info.radio.items.map((e) {
                      return CustomRadio(
                        value: 0,
                        title: "مشتريات ذاتية",
                        groupValue: _groupValue,
                        onChanged: (value) {
                          setState(() {
                            _groupValue = value;
                          });
                        },
                      );
                    }).toList(),
              ),
            ],

            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: EditorLabel("ماهي قيمة المشتريات الإجمالية ؟"),
            ),
            BorderDecoratorTheme(
              child: NumbersEditor(
                initialValue: widget.availableQuantity,
                onChanged: (value) {},
                textAlign: TextAlign.center,
                suffixIcon: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "ريال",
                    style: TextStyle(
                      color: context.colorPalette.black001,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            ImagesAttacher(onTap: () {}, title: "ارفاق صورة عن الفاتورة او سند الإستلام"),
          ],
        ),
      ),
    );
  }
}
