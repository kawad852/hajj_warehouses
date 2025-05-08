import 'package:shared/shared.dart';

import '../../../screens_exports.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  late Query<ItemModel> _query;

  void _initialize() {
    _query = kFirebaseInstant.items.whereIdBranch.orderByDesc;
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.appLocalization.stock), forceMaterialTransparency: true),
      body: CustomFirestoreQueryBuilder(
        query: _query,
        onComplete: (context, snapshot) {
          final items = snapshot.docs;
          if (items.isEmpty) {
            return EmptyWidget(title: context.appLocalization.stockIsEmpty);
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
                      if (snapshot.isLoadingMore(index)) {
                        return const FPLoading();
                      }
                      final item = items[index].data();
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
