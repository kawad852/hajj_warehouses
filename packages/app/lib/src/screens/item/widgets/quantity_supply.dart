import 'package:shared/shared.dart';

class QuantitySupply extends StatefulWidget {
  final int availableQuantity;

  const QuantitySupply({super.key, required this.availableQuantity});

  @override
  State<QuantitySupply> createState() => _QuantitySupplyState();
}

class _QuantitySupplyState extends State<QuantitySupply> {
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
            "طلب تزويد كمية للصنف",
            style: TextStyle(
              color: context.colorPalette.black001,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          CounterWidget(maxQuantity: 1, onChanged: (value) {}),
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
          const Spacer(),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "مشروحات وملاحظات حول الطلب",
              style: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BaseEditor(
              onChanged: (value) {},
              filled: true,
              fillColor: Colors.transparent,
              maxLines: 4,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.colorPalette.greyBDB),
                borderRadius: BorderRadius.circular(kRadiusSecondary),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.colorPalette.greyBDB),
                borderRadius: BorderRadius.circular(kRadiusSecondary),
              ),
            ),
          ),
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
