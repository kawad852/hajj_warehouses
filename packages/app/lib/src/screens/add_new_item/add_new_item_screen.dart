import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class AddNewItemScreen extends StatefulWidget {
  const AddNewItemScreen({super.key});

  @override
  State<AddNewItemScreen> createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  late final TextEditingController counterCtrl;
  int quntity = 1;
  List<String> data = [
    "تفاح",
    "موز",
    "عصير المراعي برتقال",
    "لبن المراعي كامل الدسم",
    "صلصلة طماطم",
    "بهارات كبسة حارة",
  ];

  @override
  void initState() {
    super.initState();
    counterCtrl = TextEditingController(text: "1");
  }

  @override
  void dispose() {
    counterCtrl.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      quntity++;
      counterCtrl.text = quntity.toString();
    });
  }

  void _decrementCounter() {
    if (quntity > 1) {
      setState(() {
        quntity--;
        counterCtrl.text = quntity.toString();
      });
    }
  }

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
                        onPressed: () {
                          _decrementCounter();
                        },
                        icon: const CustomSvg(MyIcons.subtract),
                      ),
                    ),
                    Expanded(
                      child: NumbersEditor(
                        controller: counterCtrl,
                        onChanged: (value) {
                          setState(() {
                            quntity = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          _incrementCounter();
                        },
                        icon: const CustomSvg(MyIcons.plus),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 200),
          Text(
            "مقترحات",
            style: TextStyle(
              color: context.colorPalette.black001,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            children:
                data.map((item) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: context.colorPalette.greyDAD,
                          ),
                          borderRadius: BorderRadius.circular(kRadiusSecondary),
                        ),
                        child: Row(
                          children: [
                            CustomSvg(
                              MyIcons.addTask,
                              color: context.colorPalette.grey708,
                              width: 20,
                            ),
                            const SizedBox(width: 7),
                            Text(
                              item,
                              style: TextStyle(
                                color: context.colorPalette.black001,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
