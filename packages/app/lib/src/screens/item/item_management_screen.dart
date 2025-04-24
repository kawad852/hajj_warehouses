import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class ItemManagementScreen extends StatefulWidget {
  final ItemModel item;

  const ItemManagementScreen({super.key, required this.item});

  @override
  State<ItemManagementScreen> createState() => _ItemManagementScreenState();
}

class _ItemManagementScreenState extends State<ItemManagementScreen> {
  late Stream<ItemModel> _itemStream;
  late Query<InventoryOperationModel> _operationsQuery;

  ItemModel get _item => widget.item;

  void _initializeItem() {
    _itemStream = kFirebaseInstant.items.doc(_item.id).snapshots().map((e) => e.data()!);
  }

  void _initializeOperations() {
    _operationsQuery = BranchQueries.inventoryOperations;
  }

  void _openSheet(
    BuildContext context, {
    required ItemModel item,
    required OperationType operationType,
    int? maxQuantity,
  }) {
    context.showBottomSheet(
      context,
      builder: (context) {
        return OperationInputScreen(
          item: item,
          operationType: operationType,
          maxQuantity: maxQuantity,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeItem();
    _initializeOperations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImpededStreamBuilder(
        stream: _itemStream,
        initialData: _item,
        onComplete: (context, snapshot) {
          final item = snapshot.data!;
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                pinned: true,
                title: AppBarText("إدارة صنف"),
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomSvg(MyIcons.edit, width: 30),
                  ),
                ],
              ),

              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                sliver: SliverList.list(
                  children: [
                    ManageButton(title: "اسم الصنف: ${item.name}"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: ManageButton(
                              title: "الكمية المتوفرة : ${item.quantity}",
                              backgroundColor: context.colorPalette.grey708,
                              textColor: context.colorPalette.white,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ManageButton(
                              title: "الحد الأدنى : ${item.minimumQuantity}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ManageButton(
                            onTap: () {
                              _openSheet(context, item: item, operationType: OperationType.add);
                            },
                            title: "اضافة كمية",
                            iconWidth: 20,
                            icon: MyIcons.addTask,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: ManageButton(
                            onTap: () {
                              _openSheet(context, item: item, operationType: OperationType.supply);
                            },
                            title: "طلب تزويد",
                            icon: MyIcons.truckTime,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 4,
                          child: ManageButton(
                            onTap: () {
                              _openSheet(
                                context,
                                item: item,
                                operationType: OperationType.destroy,
                                maxQuantity: _item.quantity,
                              );
                            },
                            title: "إتلاف اصناف",
                            backgroundColor: context.colorPalette.redC33,
                            icon: MyIcons.trash,
                            iconColor: null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: ManageButton(
                        onTap: () {},
                        width: 115,
                        title: "سحب كمية",
                        iconWidth: 20,
                        icon: MyIcons.addTask,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 10),
                      child: Text(
                        "عمليات تمت على الصنف",
                        style: TextStyle(
                          color: context.colorPalette.black001,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverFillRemaining(
                  child: SingleChildScrollView(
                    child: CustomFirestoreQueryBuilder(
                      query: _operationsQuery,
                      onComplete: (context, snapshot) {
                        return ProcessTimeLine(
                          itemCount: snapshot.docs.length,
                          contentsBuilder: (context, index) {
                            if (snapshot.isLoadingMore(index)) {
                              return const FPLoading();
                            }
                            final operation = snapshot.docs[index].data();
                            return OperationCard(operation: operation, itemId: _item.id);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
