import 'package:shared/shared.dart';

import '../../../screens_exports.dart';

class OutOfStockItemsScreen extends StatefulWidget {
  const OutOfStockItemsScreen({super.key});

  @override
  State<OutOfStockItemsScreen> createState() => _OutOfStockItemsScreenState();
}

class _OutOfStockItemsScreenState extends State<OutOfStockItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.appLocalization.itemsNeedingRestock), forceMaterialTransparency: true),
      body: OutOfStockSelector(
        builder: (context, items) {
          if (items.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const MaterialsTable(),
                Expanded(
                  child: ListView.separated(
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
