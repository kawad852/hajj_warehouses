import 'package:app/src/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../screens_exports.dart';

class DepartmentItemManagementScreen extends StatefulWidget {
  const DepartmentItemManagementScreen({super.key});

  @override
  State<DepartmentItemManagementScreen> createState() => _DepartmentItemManagementScreenState();
}

class _DepartmentItemManagementScreenState extends State<DepartmentItemManagementScreen> {
  late Query<CategoryModel> _query;

  void _initialize() {
    _query = kFirebaseInstant.categories
        .where(MyFields.userId, isEqualTo: kSelectedUserId)
        .orderBy(MyFields.createdAt, descending: true);
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: StretchedButton(
          onPressed: () {},
          child: Text(
            "اضافة قسم جديد",
            style: TextStyle(
              color: context.colorPalette.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            centerTitle: true,
            pinned: true,
            leading: CustomBack(),
            title: AppBarText("ادارة الأقسام والأصناف"),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            sliver: SliverList.list(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "لإدارة الأصناف والكميات المتوفرة يممكنك ادارتها من داخل القسم الذي يتبع له الصنف",
                  style: TextStyle(
                    color: context.colorPalette.grey666,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: ProductsSearchScreen(indexName: AlgoliaIndices.categories.value),
                ),
              ],
            ),
          ),
          CustomFirestoreQueryBuilder(
            query: _query,
            isSliver: true,
            onComplete: (context, snapshot) {
              return SliverList.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemCount: snapshot.docs.length,
                itemBuilder: (context, index) {
                  if (snapshot.isLoadingMore(index)) {
                    return const FPLoading();
                  }
                  final category = snapshot.docs[index].data();
                  return GestureDetector(
                    onTap: () {
                      context.push((context) => DepartmentScreen(category: category));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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
                            width: 25,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              category.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: context.colorPalette.black001,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const CustomSvg(MyIcons.edit),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
