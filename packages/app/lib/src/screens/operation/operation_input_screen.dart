import 'package:shared/shared.dart';

import '../search/search_screen.dart';

class OperationInputScreen extends StatefulWidget {
  final ItemModel? item;
  final OperationType operationType;
  final int? maxQuantity;

  const OperationInputScreen({super.key, required this.operationType, this.item, this.maxQuantity});

  @override
  State<OperationInputScreen> createState() => _OperationInputScreenState();
}

class _OperationInputScreenState extends State<OperationInputScreen> {
  late InventoryOperationModel _operation;
  late Future<List<BranchModel>> _branchesFuture;

  OperationType get _operationType => widget.operationType;
  bool get _isAddOperation => _operationType == OperationType.add;
  bool get _isSupplyOperation => _operationType == OperationType.supply;
  bool get _isDestroyOperation => _operationType == OperationType.destroy;
  bool get _isTransferOperation => _operationType == OperationType.transfer;
  ItemModel? get _item => widget.item;
  bool get _singleItem => _item != null;

  String? get _radioGroupValue {
    if (_isAddOperation) {
      return _operation.supplyType;
    } else if (_isSupplyOperation || _isTransferOperation) {
      return _operation.requestType;
    } else if (_isDestroyOperation) {
      return _operation.destroyReason;
    } else {
      throw "";
    }
  }

  void _initializeBranches() {
    if (_isTransferOperation) {
      _branchesFuture = context.appProvider.getBranches();
      _operation.transferFromBranch = LightBranchModel(id: kSelectedBranchId);
      _operation.transferToBranch = LightBranchModel();
    } else {
      _branchesFuture = Future.value([]);
    }
  }

  void _onFileAdd(List<XFile> files) => _operation.files!.addAll(files);

  @override
  void initState() {
    super.initState();
    _operation = InventoryOperationModel(
      operationType: _operationType.value,
      files: [],
      branchId: kSelectedBranchId,
      user: kCurrentLightUser,
      items:
          _item != null
              ? [
                LightItemModel(
                  id: _item!.id,
                  name: _item!.name,
                  quantity: _item!.quantity,
                  minimumQuantity: _item!.minimumQuantity,
                ),
              ]
              : [],
    );
    _initializeBranches();
  }

  @override
  Widget build(BuildContext context) {
    final info = _operationType.getInfo(context, _singleItem);
    return BigFutureBuilder(
      future: _branchesFuture,
      onComplete: (context, snapshot) {
        final branches = snapshot.data!;
        return Scaffold(
          backgroundColor: _singleItem ? Colors.transparent : null,
          appBar: _singleItem ? null : AppBar(title: Text(info.title)),
          bottomNavigationBar: BottomButton(
            text: info.buttonLabel,
            onPressed: () {
              String? errorMsg;
              if (_radioGroupValue == null) {
                if (_isAddOperation) {
                  errorMsg = 'يجب تحديد نوع التوريد';
                } else if (_isSupplyOperation || _isTransferOperation) {
                  errorMsg = 'يجب تحديد حالة الطلب';
                } else if (_isDestroyOperation) {
                  errorMsg = 'يجب تحديد سبب الإتلاف';
                }
              } else if (_isAddOperation && (_operation.amount == null || _operation.amount == 0)) {
                errorMsg = "يجب تحديد قيمة المشتريات";
              } else if (_isTransferOperation &&
                  (_operation.transferFromBranch?.id == null ||
                      _operation.transferToBranch?.id == null)) {
                errorMsg = "يجب تحديد الفرع المرسل والفرع المستقبل";
              } else if (!_isSupplyOperation &&
                  !_isTransferOperation &&
                  _operation.files!.isEmpty) {
                errorMsg = "يجب إرفاق صورة";
              } else if (!_singleItem && _operation.items.isEmpty) {
                errorMsg = "يجب تحديد الأصناف";
              } else if (!_singleItem && _operation.items.any((e) => e.quantity == 0)) {
                errorMsg = "يجب تحديد الكمية لجميع الأصناف";
              }
              if (errorMsg != null) {
                Fluttertoast.showToast(msg: errorMsg);
              } else {
                context.inventoryProvider.createOperation(
                  context,
                  operation: _operation,
                  updateBalance: _isAddOperation,
                );
              }
            },
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_singleItem) ...[
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
                  CounterWidget(
                    maxQuantity: widget.maxQuantity,
                    onChanged: (value) {
                      _operation.items.first.quantity = value;
                    },
                  ),
                ],

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
                                } else if (_isSupplyOperation || _isTransferOperation) {
                                  _operation.requestType = value!;
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
                      onChanged: (value) => _operation.amount = value,
                      textAlign: TextAlign.center,
                      suffixText: "ريال",
                    ),
                  ),

                  ImagesAttacher(
                    onChanged: _onFileAdd,
                    title: "ارفاق صورة عن الفاتورة او سند الإستلام",
                  ),
                ],

                if (_isTransferOperation)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: BranchesDropdown(
                            key: ValueKey(_operation.transferToBranch?.id),
                            value: _operation.transferFromBranch?.id,
                            branches: branches,
                            title: "الفرع المرسل",
                            onChanged: (value) {
                              setState(() {
                                if (_operation.transferFromBranch?.id != value) {
                                  _operation.items.clear();
                                }
                                _operation.transferFromBranch?.id = value;
                                if (_operation.transferFromBranch?.id ==
                                    _operation.transferToBranch?.id) {
                                  _operation.transferToBranch?.id = null;
                                }
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BranchesDropdown(
                            key: ValueKey(_operation.transferFromBranch?.id),
                            value: _operation.transferToBranch?.id,
                            branches:
                                branches
                                    .where((e) => e.id != _operation.transferFromBranch?.id)
                                    .toList(),
                            title: "الفرع المستقبل",
                            onChanged:
                                _operation.transferFromBranch?.id != null
                                    ? (value) {
                                      _operation.transferToBranch?.id = value;
                                      if (_operation.transferFromBranch?.id ==
                                          _operation.transferToBranch?.id) {
                                        _operation.transferFromBranch?.id = null;
                                      }
                                    }
                                    : null,
                          ),
                        ),
                      ],
                    ),
                  ),

                if (_isSupplyOperation || _isDestroyOperation || _isTransferOperation) ...[
                  SizedBox(height: _isSupplyOperation ? 50 : 30),
                  EditorLabel(
                    _isSupplyOperation
                        ? "مشروحات وملاحظات حول الطلب"
                        : "مشروحات وملاحظات حول الإتلاف",
                  ),
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
                  ImagesAttacher(
                    onChanged: _onFileAdd,
                    title: "ارفاق صور عن المواد التي سيتم اتلافها",
                  ),
                ],

                ///List ...
                if (!_singleItem) ...[
                  const SizedBox(height: 30),
                  Text(
                    "يرجى ادخال الأصناف والكميات المراد اتلافها من كل صنف",
                    style: TextStyle(
                      color: context.colorPalette.grey666,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const ItemTableHeader(),
                  ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 5),
                    itemCount: _operation.items.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 5),
                    itemBuilder: (context, index) {
                      final item = _operation.items[index];
                      final length = _operation.items.length;
                      return ItemTableCell(
                        key: ValueKey("$length${item.id}"),
                        initialValue: item.quantity == 0 ? null : item.quantity,
                        onChangedQuntity: (value) => item.quantity = value!,
                        itemName: item.name,
                        autoFocus: index + 1 == length,
                        length: length,
                        onRemove: () {
                          setState(() {
                            _operation.items.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                  SearchScreen(
                    indexName: AlgoliaIndices.items.value,
                    isFullScreen: false,
                    hintText: "ادخل رقم الصنف او الإسم",
                    filters:
                        _isTransferOperation
                            ? '${MyFields.branchId}:${_operation.transferFromBranch?.id}'
                            : null,
                    onTap: (e) {
                      final ids = _operation.items.map((e) => e.id).toList();
                      if (ids.contains(e.id)) {
                        Fluttertoast.showToast(msg: "الصنف مضاف مسبقا");
                        return;
                      }
                      context.pop();
                      final item = LightItemModel(
                        id: e.id,
                        name: e.name,
                        quantity: 0,
                        minimumQuantity: e.minimumQuantity,
                      );
                      setState(() {
                        _operation.items.add(item);
                      });
                    },
                    builder: (controller) {
                      return BaseEditor(
                        hintText: "ادخل رقم الصنف او الإسم",
                        hintStyle: TextStyle(
                          color: context.colorPalette.grey666,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        readOnly: true,
                        onTap: () {
                          if (_isTransferOperation && _operation.transferFromBranch == null) {
                            Fluttertoast.showToast(msg: "يجب إختيار الفرع أولا");
                            return;
                          }
                          controller.openView();
                        },
                        canRequestFocus: false,
                        prefixIcon: IconButton(
                          onPressed: null,
                          icon: CustomSvg(
                            MyIcons.addTask,
                            color: context.colorPalette.grey708,
                            width: 20,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
