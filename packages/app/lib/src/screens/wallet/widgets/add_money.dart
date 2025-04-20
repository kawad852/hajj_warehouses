import 'package:shared/shared.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({super.key});

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  int? _groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.colorPalette.greyF2F,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text(
            "اضافة عهدة",
            style: TextStyle(
              color: context.colorPalette.black001,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          CounterWidget(initialValue: 1, onChanged: (value) {}),
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
                "سبب الإضافة",
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 14,
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
                title: "لأول مره",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                  });
                },
              ),
              CustomRadio(
                value: 1,
                title: "تزويد اضافي",
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
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TitledTextField(
              title: "مشروحات وملاحظات",
              textStyle: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
              child: BaseEditor(
                onChanged: (value) {},
                filled: true,
                fillColor: Colors.transparent,
                maxLines: 4,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colorPalette.grey708),
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colorPalette.grey708),
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
              ),
            ),
          ),
          TitledTextField(
            title: "الموظف المسؤول",
            textStyle: TextStyle(
              color: context.colorPalette.black001,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: context.colorPalette.grey708),
                borderRadius: BorderRadius.circular(kRadiusSecondary),
              ),
              child: DropDownEditor(
                items: const [],
                onChanged: (value) {},
                title: "اختر الموظف",
                value: "s",
              ),
            ),
          ),
          ImagesAttacher(onChanged: (path) {}, title: "ارفاق صورة لسند التسليم او الحوالة"),
          const Spacer(),
          StretchedButton(
            onPressed: () {},
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              "اضافة",
              style: TextStyle(
                color: context.colorPalette.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
