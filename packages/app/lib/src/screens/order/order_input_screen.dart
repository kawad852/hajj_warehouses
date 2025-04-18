import 'package:shared/shared.dart';

class OrderInputScreen extends StatefulWidget {
  const OrderInputScreen({super.key});

  @override
  State<OrderInputScreen> createState() => _OrderInputScreenState();
}

class _OrderInputScreenState extends State<OrderInputScreen> {
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
        title: const AppBarText("ارسال طلب جديد"),
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
                "حالة الطلب",
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
          const SizedBox(height: 80),
          Text(
            "مشروحات وملاحظات حول الطلب",
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
            "يمكنك اضافة اكثر من صنف إلى الطلب مع تحديد الكمية المطلوبة لكل صنف  ",
            style: TextStyle(
              color: context.colorPalette.grey666,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.only(top: 10, bottom: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: context.colorPalette.grey74D,
              borderRadius: BorderRadius.circular(kRadiusSecondary),
            ),
            child: const Row(
              children: [
                Expanded(flex: 2, child: TableText("#")),
                Expanded(flex: 10, child: TableText("اسم الصنف")),
                CustomLine(),
                Expanded(flex: 6, child: TableText("الكمية المطلوبة", textAlign: TextAlign.center)),
              ],
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 5),
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: context.colorPalette.greyF2F,
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                child: const Row(
                  children: [
                    Expanded(flex: 2, child: TableText("25")),
                    Expanded(flex: 10, child: TableText("طماطم صناديق")),
                    CustomLine(),
                    Expanded(flex: 6, child: TableText("00", textAlign: TextAlign.center)),
                  ],
                ),
              );
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
              icon: CustomSvg(MyIcons.addTask, color: context.colorPalette.grey708, width: 20),
            ),
          ),
        ],
      ),
    );
  }
}
