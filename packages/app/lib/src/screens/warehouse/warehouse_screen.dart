import 'package:app/screens_exports.dart';
import 'package:app/shared.dart';
import 'package:app/src/screens/search/search_screen.dart';
import 'package:shared/shared.dart';

class WarehouseScreen extends StatefulWidget {
  const WarehouseScreen({super.key});

  @override
  State<WarehouseScreen> createState() => _WarehouseScreenState();
}

class _WarehouseScreenState extends State<WarehouseScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          sliver: SliverList.list(
            children: [
              Row(
                children: [
                  OutOfStockSelector(
                    builder: (context, items) {
                      return WarehouseButton(
                        onTap: () {
                          context.push((context) {
                            return const OutOfStockItemsScreen();
                          });
                        },
                        title: context.appLocalization.itemsNeedingRestock,
                        value: "(${items.length}) ",
                        icon: MyIcons.boxTime,
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  WarehouseButton(
                    onTap: () {
                      context.push(
                        (context) => const OperationInputScreen(operationType: OperationType.add),
                      );
                    },
                    title: context.appLocalization.addQuantityToStock,
                    icon: MyIcons.boxAdd,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    WarehouseButton(
                      onTap: () {
                        context.push((context) => const DepartmentItemManagementScreen());
                      },
                      title: context.appLocalization.departmentAndItemManagement,
                      icon: MyIcons.department,
                    ),
                    const SizedBox(width: 10),
                    WarehouseButton(
                      onTap: () {
                        context.push((context) => const OrdersScreen());
                      },
                      title: context.appLocalization.manageOrders,
                      icon: MyIcons.truckTime,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  WarehouseButton(
                    onTap: () {
                      context.push((context) => const OperationsScreen());
                    },
                    flex: 4,
                    title: context.appLocalization.operationsLog,
                    icon: MyIcons.book,
                  ),
                  const SizedBox(width: 10),
                  WarehouseButton(
                    onTap: () {
                      context.push(
                        (context) =>
                            const OperationInputScreen(operationType: OperationType.destroy),
                      );
                    },
                    flex: 3,
                    backgroundColor: context.colorPalette.redC33,
                    title: context.appLocalization.discardItems,
                    icon: MyIcons.trash,
                  ),
                  const SizedBox(width: 10),
                  WarehouseButton(
                    onTap: () {
                      context.push(
                        (context) =>
                            const OperationInputScreen(operationType: OperationType.transfer),
                      );
                    },
                    flex: 2,
                    backgroundColor: context.colorPalette.grey780,
                    title: context.appLocalization.transferMaterials,
                    icon: MyIcons.truck,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SearchScreen(indexName: AlgoliaIndices.items.value),
              ),
            ],
          ),
        ),
        OutOfStockSelector(
          builder: (context, items) {
            if (items.isEmpty) {
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            }
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverMainAxisGroup(
                slivers: [
                  SliverList.list(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              context.appLocalization.itemsNeedingRestock,
                              style: TextStyle(
                                color: context.colorPalette.black001,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.push((context) {
                                return const OutOfStockItemsScreen();
                              });
                            },
                            child: Ink(
                              child: Row(
                                children: [
                                  Text(
                                    context.appLocalization.more,
                                    style: TextStyle(
                                      color: context.colorPalette.black001,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(Icons.arrow_forward_ios_outlined),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const MaterialsTable(),
                    ],
                  ),
                  SliverList.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 5),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return TableContainer(
                        onTap: () {
                          context.push((context) => ItemManagementScreen(item: item));
                        },
                        id: item.id,
                        name: item.name,
                        availableQuantity: item.quantity,
                        minimumQuantity: item.minimumQuantity,
                        status: item.status,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
