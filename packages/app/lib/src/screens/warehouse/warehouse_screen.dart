import 'package:app/screens_exports.dart';
import 'package:app/src/screens/search/search_screen.dart';
import 'package:shared/shared.dart';

class WarehouseScreen extends StatefulWidget {
  const WarehouseScreen({super.key});

  @override
  State<WarehouseScreen> createState() => _WarehouseScreenState();
}

class _WarehouseScreenState extends State<WarehouseScreen> {
  late Query<ItemModel> _query;

  void _initialize() {
    _query = kFirebaseInstant.items.whereMyBranch.orderBy(MyFields.createdAt, descending: true);
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

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
                  WarehouseButton(
                    onTap: () {},
                    title: "اصناف بحاجة تزويد",
                    value: "(45) ",
                    icon: MyIcons.boxTime,
                  ),
                  const SizedBox(width: 10),
                  WarehouseButton(onTap: () {}, title: "اضافة كمية للمخزون", icon: MyIcons.boxAdd),
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
                      title: "ادارة الأقسام والأصناف",
                      icon: MyIcons.department,
                    ),
                    const SizedBox(width: 10),
                    WarehouseButton(
                      onTap: () {
                        context.push((context) => const OrdersManagementScreen());
                      },
                      title: "ادارة الطلبيات",
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
                    title: "سجل العمليات",
                    icon: MyIcons.book,
                  ),
                  const SizedBox(width: 10),
                  WarehouseButton(
                    onTap: () {
                      context.push(
                        (context) => OperationInputScreen(
                          operationType: OperationType.destroy,
                          item: ItemModel(),
                          maxQuantity: null,
                        ),
                      );
                    },
                    flex: 3,
                    backgroundColor: context.colorPalette.redC33,
                    title: "إتلاف اصناف",
                    icon: MyIcons.trash,
                  ),
                  const SizedBox(width: 10),
                  WarehouseButton(
                    onTap: () {
                      context.push((context) => const SendTransferOrderScreen());
                    },
                    flex: 2,
                    backgroundColor: context.colorPalette.grey780,
                    title: "نقل مواد",
                    icon: MyIcons.truck,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ProductsSearchScreen(indexName: AlgoliaIndices.items.value),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "اصناف بحاجة إلى تزويد",
                      style: TextStyle(
                        color: context.colorPalette.black001,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "المزيد",
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
                ],
              ),
              const MaterialsTable(),
            ],
          ),
        ),
        CustomFirestoreQueryBuilder(
          query: _query,
          isSliver: true,
          onComplete: (context, snapshot) {
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverList.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemCount: snapshot.docs.length,
                itemBuilder: (context, index) {
                  final item = snapshot.docs[index].data();
                  return TableContainer(
                    onTap: () {
                      context.push((context) => ItemManagementScreen(item: item));
                    },
                    id: "$index",
                    name: item.name,
                    availableQuantity: item.quantity,
                    minimumQuantity: item.minimumQuantity,
                    status: item.status,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
