import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class SendTransferOrderScreen extends StatefulWidget {
  const SendTransferOrderScreen({super.key});

  @override
  State<SendTransferOrderScreen> createState() =>
      _SendTransferOrderScreenState();
}

class _SendTransferOrderScreenState extends State<SendTransferOrderScreen> {
  int? _groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: StretchedButton(
          onPressed: () {},
          child: Text(
            "ارسال الطلب",
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
        title: const AppBarText("ارسال طلب نقل جديد"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          Row(
            children: [
              Text(
                "*",
                style: TextStyle(
                  color: context.colorPalette.redC10,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                "حالة النقل",
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              CustomRadio(
                value: 0,
                title: "طارئة",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                  });
                },
              ),
              CustomRadio(
                value: 1,
                title: "عادية",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: TitledTextField(
                    title: "الفرع المرسل",
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    child: DropDownEditor(
                      items: const [],
                      onChanged: (value) {},
                      title: "اختر الفرع",
                      value: "s",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TitledTextField(
                    title: "الفرع المستقبل",
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    child: DropDownEditor(
                      items: const [],
                      onChanged: (value) {},
                      title: "اختر الفرع",
                      value: "s",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "مشروحات وملاحظات حول النقل",
            style: TextStyle(
              color: context.colorPalette.black001,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BaseEditor(
              onChanged: (value) {},
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.colorPalette.greyBDB),
                borderRadius: BorderRadius.circular(kRadiusSecondary),
              ),
            ),
          ),
          Text(
            "يرجى ادخال الأصناف والمواد المراد نقلها مع الكميات ",
            style: TextStyle(
              color: context.colorPalette.grey666,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const ItemTableHeader(),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 5),
            itemBuilder: (context, index) {
              return const ItemTableCell();
            },
          ),
          TextEditor(
            onChanged: (value) {},
            hintText: "ادخل رقم الصنف او الإسم",
            hintStyle: TextStyle(
              color: context.colorPalette.grey666,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: IconButton(
              onPressed: null,
              icon: CustomSvg(
                MyIcons.addTask,
                color: context.colorPalette.grey708,
                width: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
