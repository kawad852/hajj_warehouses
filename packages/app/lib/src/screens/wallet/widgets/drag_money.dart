import 'package:shared/shared.dart';

class DragMoney extends StatefulWidget {
  const DragMoney({super.key});

  @override
  State<DragMoney> createState() => _DragMoneyState();
}

class _DragMoneyState extends State<DragMoney> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.colorPalette.greyF2F,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text(
            "تسجيل مصروف",
            style: TextStyle(
              color: context.colorPalette.black001,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const CounterWidget(),
          TitledTextField(
            title: "نوع المصروف",
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
                title: "",
                value: "",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TitledTextField(
              title: "مشروحات وملاحظات المصروف",
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
          AttachImage(onTap: () {}, title: "ارفاق صورة للفاتورة"),
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
