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

  Widget _builderImageAttacher() {
    return ImagesAttacher(onTap: () {}, title: "ارفاق صورة عن الفاتورة او سند الإستلام");
  }

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
            Center(
              child: Text(
                info.title,
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
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

            if (_operationType == OperationType.add) ...[
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
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
              _builderImageAttacher(),
            ],

            if (_operationType == OperationType.supply ||
                _operationType == OperationType.destroy) ...[
              SizedBox(height: _operationType == OperationType.supply ? 50 : 30),
              const EditorLabel("مشروحات وملاحظات حول الطلب"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BorderDecoratorTheme(child: TextEditor(onChanged: (value) {}, maxLines: 4)),
              ),
            ],

            if (_operationType == OperationType.destroy) ...[
              const SizedBox(height: 10),
              Text(
                "يجب ان توضح الصور سبب اتلاف الأصناف",
                style: TextStyle(
                  color: context.colorPalette.grey666,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              _builderImageAttacher(),
            ],
          ],
        ),
      ),
    );
  }
}
