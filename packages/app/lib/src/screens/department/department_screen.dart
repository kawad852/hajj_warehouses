import 'package:app/screens_exports.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DepartmentScreen extends StatefulWidget {
  final String categoryId;

  const DepartmentScreen({super.key, required this.categoryId});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: StretchedButton(
          onPressed: () {
            context.push((context) => const AddNewItemScreen());
          },
          child: Text(
            "اضافة اصناف جديدة",
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
        title: const AppBarText("مواد غذائية"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                Expanded(
                  child: TextEditor(
                    onChanged: (value) {},
                    required: false,
                    hintText: "ابحث عن صنف",
                    hintStyle: TextStyle(
                      color: context.colorPalette.grey666,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.search)),
                  ),
                ),
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
          MaterialsTable(
            builder: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return TableContainer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
