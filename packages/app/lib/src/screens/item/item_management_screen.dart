import 'package:app/screens_exports.dart';
import 'package:app/src/screens/item/item_edit_screen.dart';
import 'package:shared/shared.dart';

class ItemManagementScreen extends StatefulWidget {
  final ItemModel? item;
  final String? id;

  const ItemManagementScreen({super.key, this.item, this.id});

  @override
  State<ItemManagementScreen> createState() => _ItemManagementScreenState();
}

class _ItemManagementScreenState extends State<ItemManagementScreen> {
  late Stream<ItemModel> _itemStream;
  late Query<InventoryOperationModel> _operationsQuery;

  ItemModel? get _item => widget.item;
  String get _id => _item?.id ?? widget.id!;

  void _initializeItem() {
    _itemStream = kFirebaseInstant.items.doc(_id).snapshots().map((e) => e.data()!);
  }

  void _initializeOperations() {
    final filter = Filter.and(
      Filter(MyFields.idBranch, isEqualTo: kSelectedBranchId),
      Filter(MyFields.itemIds, arrayContains: _id),
    );
    _operationsQuery = kFirebaseInstant.inventoryOperations.orderByDesc.where(filter);
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
      body: BigStreamBuilder(
        stream: _itemStream,
        initialData: _item,
        onComplete: (context, snapshot) {
          final item = snapshot.data!;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: AppBarText(context.appLocalization.manageItem),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      onPressed: () {
                        context.navigate((context) {
                          return ItemEditScreen(item: item);
                        });
                      },
                      icon: const CustomSvg(MyIcons.edit, width: 30),
                    ),
                  ),
                ],
              ),

              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                sliver: SliverList.list(
                  children: [
                    ManageButton(title: "${context.appLocalization.itemName}: ${item.name}"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: ManageButton(
                              title:
                                  "${context.appLocalization.availableQuantity} : ${item.quantity}",
                              backgroundColor: context.colorPalette.primary,
                              textColor: context.colorPalette.white,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ManageButton(
                              title:
                                  "${context.appLocalization.minimumLimit} : ${item.minimumQuantity}",
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
                            title: context.appLocalization.addQuantity,
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
                            title: context.appLocalization.supplyRequest,
                            icon: MyIcons.truckTime,
                          ),
                        ),
                        if (item.quantity > 0) ...[
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 4,
                            child: ManageButton(
                              onTap: () {
                                _openSheet(
                                  context,
                                  item: item,
                                  operationType: OperationType.destroy,
                                  maxQuantity: item.quantity,
                                );
                              },
                              title: context.appLocalization.discardItems,
                              backgroundColor: context.colorPalette.redC33,
                              icon: MyIcons.trash,
                              iconColor: null,
                            ),
                          ),
                        ],
                      ],
                    ),
                    if (item.quantity > 0) ...[
                      const SizedBox(height: 10),
                      ManageButton(
                        onTap: () {
                          _openSheet(
                            context,
                            item: item,
                            operationType: OperationType.withdraw,
                            maxQuantity: item.quantity,
                          );
                        },
                        width: 115,
                        title: context.appLocalization.withdrawQuantity,
                        iconWidth: 20,
                        icon: MyIcons.addTask,
                      ),
                    ],
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 10),
                      child: Text(
                        context.appLocalization.actionsTakenOnItem,
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
                    physics: const NeverScrollableScrollPhysics(),
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
                            return OperationCard(operation: operation, itemId: item.id);
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
