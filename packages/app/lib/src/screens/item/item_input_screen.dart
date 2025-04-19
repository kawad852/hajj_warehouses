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
    id: kUUID,
    status: ItemStatusEnum.available.value,
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

  void _onAdd(BuildContext context) {
    ApiService.fetch(
      context,
      callBack: () async {
        for (var e in _items) {
          e.createdAt = kNowDate;
          await kFirebaseInstant.items.doc(e.id).set(e);
        }
        if (context.mounted) {
          Fluttertoast.showToast(msg: context.appLocalization.successfullyUpdated);
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10).copyWith(top: 0),
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
                      onQuantityChanged: (quantity) {},
                      showRemove: _items.length > 1,
                      onRemove:
                          _items.length > 1
                              ? () {
                                setState(() {
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
                  child: CustomFirestoreQueryBuilder(
                    query: _suggestionsQuery,
                    onComplete: (context, snapshot) {
                      return Wrap(
                        direction: Axis.horizontal,
                        children:
                            List.generate(snapshot.docs.length, (index) {
                              if (snapshot.isLoadingMore(index)) {
                                return const FPLoading();
                              }
                              final item = snapshot.docs[index].data();
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
