import 'package:app/src/screens/item/widgets/add_item_widget.dart';
import 'package:shared/shared.dart';

class ItemInputScreen extends StatefulWidget {
  final CategoryModel category;

  const ItemInputScreen({super.key, required this.category});

  @override
  State<ItemInputScreen> createState() => _ItemInputScreenState();
}

class _ItemInputScreenState extends State<ItemInputScreen> {
  late Query<ItemModel> _suggestionsQuery;

  final List<ItemModel> _items = [];

  ItemModel get _itemModel => ItemModel(
    status: ItemStatusEnum.inStock.value,
    userId: kSelectedUserId,
    categoryId: _category.id,
  );

  CategoryModel get _category => widget.category;

  void _initialize() {
    _suggestionsQuery = kFirebaseInstant.itemSuggestions.orderBy(
      MyFields.createdAt,
      descending: true,
    );
  }

  // String _getItemStatus({required int availableQuantity, required int minimumQuantity}) {
  //   if (availableQuantity <= 0) {
  //     return ItemStatusEnum.outOfStock.value;
  //   } else if (availableQuantity < minimumQuantity) {
  //     return ItemStatusEnum.needsRestock.value;
  //   } else if (availableQuantity > minimumQuantity + kItemLimitThreshold) {
  //     return ItemStatusEnum.lowStock.value;
  //   } else {
  //     return ItemStatusEnum.inStock.value;
  //   }
  // }

  void _onAdd(BuildContext context) {
    ApiService.fetch(
      context,
      callBack: () async {
        final batch = kFirebaseInstant.batch();
        for (var e in _items) {
          e.id = await e.getId();
          e.createdAt = kNowDate;
          e.status = ItemStatusEnum.outOfStock.value;
          final itemDoc = kFirebaseInstant.items.doc(e.id);
          batch.set(itemDoc, e);
        }
        final operationDocREF = BranchQueries.inventoryOperations.doc();
        final operation = InventoryOperationModel(
          createdAt: kNowDate,
          id: operationDocREF.id,
          displayName: MySharedPreferences.user!.displayName!,
          operationType: OperationType.create.value,
          items:
              _items
                  .map((e) => LightItemModel(id: e.id, name: e.name, quantity: e.minimumQuantity))
                  .toList(),
        );
        print("operation: $operation");
        batch.set(operationDocREF, operation);
        await batch.commit();
        if (context.mounted) {
          Fluttertoast.showToast(msg: context.appLocalization.addedSuccessfully);
          context.pop();
        }
      },
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
                  _onAdd(context);
                },
      ),
      appBar: AppBar(title: const AppBarText("اضافة صنف جديد")),
      body: CustomFirestoreQueryBuilder(
        query: _suggestionsQuery,
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
                          return IconButton.filled(
                            onPressed: () {
                              setState(() {
                                _items.add(_itemModel);
                              });
                            },
                            icon: const Icon(Icons.add),
                          );
                        }
                        final element = _items[index];
                        return AddItemWidget(
                          key: ValueKey(element.id),
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
                                      // if (element.suggested) {
                                      //   final e = snapshot.docs.firstWhere(
                                      //     (e) => e.data().id == element.id,
                                      //   );
                                      //   snapshot.docs.add(e);
                                      // }
                                      _items.removeAt(index);
                                    });
                                  }
                                  : null,
                        );
                      }).separator(const SizedBox(height: 10)).toList(),
                ),
              ),
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
                            List.generate(snapshot.docs.length, (index) {
                              if (snapshot.isLoadingMore(index)) {
                                return const FPLoading();
                              }
                              final item = snapshot.docs[index].data();
                              item.suggested = true;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _items.add(item);
                                    snapshot.docs.removeAt(index);
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
