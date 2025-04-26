import 'package:app/screens_exports.dart';
import 'package:app/src/screens/search/search_screen.dart';
import 'package:shared/shared.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryModel category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Query<ItemModel> _query;

  CategoryModel get _category => widget.category;

  void _initialize() {
    _query =
        kFirebaseInstant.items
            .where(MyFields.categoryId, isEqualTo: _category.id)
            .whereMyBranch
            .orderByDesc;
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomButton(
        text: "اضافة اصناف جديدة",
        onPressed: () {
          context.push((context) => ItemInputScreen(category: _category));
        },
      ),
      appBar: AppBar(title: AppBarText(_category.name)),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            sliver: SliverList.list(
              children: [
                Text(
                  "لإدارة الصنف او تزويده يمكنك ذلك من خلال الدخول لصفحة الصنف",
                  style: TextStyle(
                    color: context.colorPalette.grey666,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Expanded(child: ProductsSearchScreen(indexName: AlgoliaIndices.items.value)),
                      const SizedBox(width: 10),
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: context.colorPalette.greyD9D),
                          borderRadius: BorderRadius.circular(kRadiusSecondary),
                        ),
                        child: const CustomSvg(MyIcons.filter),
                      ),
                    ],
                  ),
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
                      id: item.id,
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
      ),
    );
  }
}
