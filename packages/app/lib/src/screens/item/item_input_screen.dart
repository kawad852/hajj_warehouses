import 'package:app/src/screens/item/widgets/add_item_widget.dart';
import 'package:shared/shared.dart';

class ItemInputScreen extends StatefulWidget {
  final CategoryModel category;

  const ItemInputScreen({super.key, required this.category});

  @override
  State<ItemInputScreen> createState() => _ItemInputScreenState();
}

class _ItemInputScreenState extends State<ItemInputScreen> {
  late Stream<List<ItemModel>> _suggestionsQuery;

  final List<ItemModel> _items = [];

  ItemModel get _itemModel => ItemModel(
    status: ItemStatusEnum.inStock.value,
    categoryId: _category.id,
    user: kCurrentLightUser,
    branchId: kSelectedBranchId,
  );

  CategoryModel get _category => widget.category;

  void _initialize() {
    _suggestionsQuery = kFirebaseInstant.itemSuggestions.orderByDesc.snapshots().map(
      (e) => e.docs.map((e) => e.data()).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    _items.add(_itemModel);
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomButton(
        text: "اضافة",
        onPressed:
            _items.any((e) => e.name.isEmpty)
                ? null
                : () {
                  context.inventoryProvider.createOperation(
                    context,
                    operation: InventoryOperationModel(
                      operationType: OperationType.create.value,
                      items: [],
                      branchId: kSelectedBranchId,
                      user: kCurrentLightUser,
                    ),
                    onCreate: (batch) async {
                      for (var e in _items) {
                        e.id = await e.getId();
                        e.createdAt = kNowDate;
                        e.status = ItemStatusEnum.outOfStock.value;
                        final itemDoc = kFirebaseInstant.items.doc(e.id);
                        batch.set(itemDoc, e);
                      }
                      return _items;
                    },
                  );
                },
      ),
      appBar: AppBar(title: const AppBarText("اضافة صنف جديد")),
      body: ImpededStreamBuilder(
        stream: _suggestionsQuery,
        onComplete: (context, snapshot) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ).copyWith(top: 0),
                  child: Text(
                    "يمكنك اضافة اكثر من صنف في نفس الوقت، لا يمكن تكرار اسماء الأصناف الجديدة مع الأصناف الموجوده مسبقاً.",
                    style: TextStyle(
                      color: context.colorPalette.grey666,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverList.list(
                  children:
                      List.generate(_items.length + 1, (index) {
                        if (index == _items.length) {
                          return Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  _items.add(_itemModel);
                                });
                              },
                              label: const Text("إضافة المزيد"),
                              icon: const Icon(Icons.add),
                            ),
                          );
                        }
                        final element = _items[index];
                        return AddItemWidget(
                          key: ValueKey("${element.id}$index"),
                          initialValue: element.name,
                          onChanged: (value) {
                            element.name = value!;
                            if (value.isEmpty || value.length == 1) {
                              setState(() {});
                            }
                          },
                          onQuantityChanged: (quantity) => element.minimumQuantity = quantity,
                          showRemove: _items.length > 1,
                          onRemove:
                              _items.length > 1
                                  ? () {
                                    setState(() {
                                      if (element.suggested) {
                                        snapshot.data!.add(element);
                                      }
                                      _items.removeAt(index);
                                    });
                                  }
                                  : null,
                        );
                      }).separator(const SizedBox(height: 10)).toList(),
                ),
              ),

              ///Suggestions
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                sliver: SliverMainAxisGroup(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "مقترحات",
                          style: TextStyle(
                            color: context.colorPalette.black001,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Wrap(
                        direction: Axis.horizontal,
                        children:
                            List.generate(snapshot.data!.length, (index) {
                              final item = snapshot.data![index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _items.add(
                                      _itemModel.copyWith(name: item.name, suggested: true),
                                    );
                                    snapshot.data!.removeAt(index);
                                  });
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 2,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: context.colorPalette.greyDAD),
                                        borderRadius: BorderRadius.circular(kRadiusSecondary),
                                      ),
                                      child: Row(
                                        children: [
                                          CustomSvg(
                                            MyIcons.addTask,
                                            color: context.colorPalette.grey708,
                                            width: 20,
                                          ),
                                          const SizedBox(width: 7),
                                          Text(
                                            item.name,
                                            style: TextStyle(
                                              color: context.colorPalette.black001,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
