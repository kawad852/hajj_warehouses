import 'package:shared/shared.dart';

class AddQuntity extends StatefulWidget {
  const AddQuntity({super.key});

  @override
  State<AddQuntity> createState() => _AddQuntityState();
}

class _AddQuntityState extends State<AddQuntity> {
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
            "إضافة كمية جديدة للصنف",
            style: TextStyle(
              color: context.colorPalette.black001,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const CounterWidget(),
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
                "نوع التوريد",
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
                title: "مشتريات ذاتية",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                  });
                },
              ),
              CustomRadio(
                value: 1,
                title: "استلام طلبية",
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
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Row(
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
                  "ماهي قيمة المشتريات الإجمالية ؟",
                  style: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          BaseEditor(
            onChanged: (value) {},
            filled: true,
            fillColor: Colors.transparent,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            suffixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 10, top: 10),
              child: Text(
                "ريال",
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorPalette.greyBDB),
              borderRadius: BorderRadius.circular(kRadiusSecondary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorPalette.greyBDB),
              borderRadius: BorderRadius.circular(kRadiusSecondary),
            ),
          ),
          AttachImage(
            onTap: () {},
            title: "ارفاق صورة عن الفاتورة او سند الإستلام",
          ),
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
