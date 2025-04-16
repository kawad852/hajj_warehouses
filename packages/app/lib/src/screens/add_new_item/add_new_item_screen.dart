import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class AddNewItemScreen extends StatefulWidget {
  const AddNewItemScreen({super.key});

  @override
  State<AddNewItemScreen> createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  int quntity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: StretchedButton(
          onPressed: () {},
          child: Text(
            "اضافة",
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
        title: const AppBarText("اضافة صنف جديد"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          Text(
            "يمكنك اضافة اكثر من صنف في نفس الوقت، لا يمكن تكرار اسماء الأصناف الجديدة مع الأصناف الموجوده مسبقاً.",
            style: TextStyle(
              color: context.colorPalette.grey666,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextEditor(
                  onChanged: (value) {},
                  required: false,
                  hintText: "اكتب اسم الصنف",
                  hintStyle: TextStyle(
                    color: context.colorPalette.grey666,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 100,
                height: 48,
                decoration: BoxDecoration(
                  color: context.colorPalette.greyF2F,
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const CustomSvg(MyIcons.subtract),
                      ),
                    ),
                    Expanded(
                      child: NumbersEditor(
                        onChanged: (quntity) {},
                        initialValue: quntity,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            quntity++;
                          });
                        },
                        icon: const CustomSvg(MyIcons.plus),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
