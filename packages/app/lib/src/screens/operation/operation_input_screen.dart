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
              Row(
                children: [
                  Text(
                    "*",
                    style: TextStyle(
                      color: context.colorPalette.redC10,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    info.radio.label,
                    style: TextStyle(
                      color: context.colorPalette.black001,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
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
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "*",
                    style: TextStyle(
                      color: context.colorPalette.redC10,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "ماهي قيمة المشتريات الإجمالية ؟",
                    style: TextStyle(
                      color: context.colorPalette.black001,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            BaseEditor(
              initialValue: widget.availableQuantity.toString(),
              onChanged: (value) {},
              filled: true,
              fillColor: Colors.transparent,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(end: 10, top: 10),
                child: Text(
                  "ريال",
                  style: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.colorPalette.greyBDB),
                borderRadius: BorderRadius.circular(kRadiusSecondary),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.colorPalette.greyBDB),
                borderRadius: BorderRadius.circular(kRadiusSecondary),
              ),
            ),
            AttachImage(onTap: () {}, title: "ارفاق صورة عن الفاتورة او سند الإستلام"),
          ],
        ),
      ),
    );
  }
}
