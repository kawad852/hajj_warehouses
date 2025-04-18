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
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBack(),
        title: const AppBarText("ادارة الأقسام والأصناف"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: TextEditor(
                onChanged: (value) {},
                required: false,
                hintText: "ابحث عن تصنيف",
                hintStyle: TextStyle(
                  color: context.colorPalette.grey666,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.search)),
              ),
            ),
            Expanded(
              child: CustomFirestoreQueryBuilder(
                query: _query,
                onComplete: (context, snapshot) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 5),
                    itemCount: snapshot.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (snapshot.isLoadingMore(index)) {
                        return const FPLoading();
                      }
                      final category = snapshot.docs[index].data();
                      return GestureDetector(
                        onTap: () {
                          context.push((context) => DepartmentScreen(categoryId: category.id));
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
            ),
          ],
        ),
      ),
    );
  }
}
