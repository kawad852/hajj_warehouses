import 'package:shared/shared.dart';

class OperationInputScreen extends StatefulWidget {
  final ItemModel item;
  final OperationType operationType;

  const OperationInputScreen({super.key, required this.operationType, required this.item});

  @override
  State<OperationInputScreen> createState() => _OperationInputScreenState();
}

class _OperationInputScreenState extends State<OperationInputScreen> {
  late InventoryOperationModel _operation;

  OperationType get _operationType => widget.operationType;
  bool get _isAddOperation => _operationType == OperationType.add;
  bool get _isSupplyOperation => _operationType == OperationType.supply;
  bool get _isDestroyOperation => _operationType == OperationType.destroy;
  ItemModel get _item => widget.item;

  String? get _radioGroupValue {
    if (_isAddOperation) {
      print("alksfjakljsf: ${_operation.supplyType}");
      return _operation.supplyType;
    } else if (_isSupplyOperation) {
      return _operation.requestType;
    } else if (_isDestroyOperation) {
      return _operation.destroyReason;
    } else {
      throw "";
    }
  }

  @override
  void initState() {
    super.initState();
    _operation = InventoryOperationModel(
      operationType: _operationType.value,
      displayName: MySharedPreferences.user!.displayName!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final info = _operationType.getInfo(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomButton(
        text: "اضافة",
        onPressed: () {
          String? errorMsg;
          if (_radioGroupValue == null) {
            if (_isAddOperation) {
              errorMsg = 'يجب تحديد نوع التوريد';
            } else if (_isSupplyOperation) {
              errorMsg = 'يجب تحديد حالة الطلب';
            } else if (_isDestroyOperation) {
              errorMsg = 'يجب تحديد سبب الإتلاف';
            }
          } else if (_isAddOperation && _operation.totalPayment == 0) {
            errorMsg = "يجب تحديد قيمة المشتريات";
          } else if (_operation.images.isEmpty) {
            errorMsg = "يجب إرفاق صورة";
          }
          if (errorMsg != null) {
            context.showSnackBar(errorMsg);
          } else {
            context.inventoryProvider.updateInventory(
              context,
              items: [_item],
              operationType: _operationType.value,
            );
          }
        },
      ),
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
            CounterWidget(initialValue: _item.availableQuantity, onChanged: (value) {}),
            if (info.radio.items.isNotEmpty) ...[
              EditorLabel(info.radio.label),
              const SizedBox(height: 8),
              Row(
                children:
                    info.radio.items.map((e) {
                      return CustomRadio(
                        value: e.value,
                        title: e.label,
                        groupValue: _radioGroupValue,
                        onChanged: (value) {
                          setState(() {
                            if (_isAddOperation) {
                              _operation.supplyType = value!;
                            } else if (_isSupplyOperation) {
                              _operation.supplyType = value!;
                            } else if (_isDestroyOperation) {
                              _operation.destroyReason = value!;
                            }
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
                child: DecimalsEditor(
                  onChanged: (value) => _operation.totalPayment = value!,
                  textAlign: TextAlign.center,
                  suffixText: "ريال",
                ),
              ),
              ImagesAttacher(onChanged: (path) {}, title: "ارفاق صورة عن الفاتورة او سند الإستلام"),
            ],

            if (_operationType == OperationType.supply ||
                _operationType == OperationType.destroy) ...[
              SizedBox(height: _operationType == OperationType.supply ? 50 : 30),
              const EditorLabel("مشروحات وملاحظات حول الطلب"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BorderDecoratorTheme(
                  child: TextEditor(
                    onChanged: (value) {
                      _operation.notes = value!;
                    },
                    maxLines: 4,
                  ),
                ),
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
              ImagesAttacher(onChanged: (path) {}, title: "ارفاق صور عن المواد التي سيتم اتلافها"),
            ],
          ],
        ),
      ),
    );
  }
}
