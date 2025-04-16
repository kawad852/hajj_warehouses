import 'package:app/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DepartmentItemManagementScreen extends StatefulWidget {
 const DepartmentItemManagementScreen({super.key});

  @override
  State<DepartmentItemManagementScreen> createState() => _DepartmentItemManagementScreenState();
}

class _DepartmentItemManagementScreenState extends State<DepartmentItemManagementScreen> {
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
                prefixIcon: const IconButton(
                  onPressed: null,
                  icon: CustomSvg(MyIcons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemCount: 7,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.push((context) => const DepartmentScreen());
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
                              "مواد غذائية",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
