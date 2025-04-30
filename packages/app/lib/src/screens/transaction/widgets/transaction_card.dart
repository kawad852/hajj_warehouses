import 'package:shared/shared.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomSvg(MyIcons.addSquare),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            margin: const EdgeInsetsDirectional.only(bottom: 10),
            decoration: BoxDecoration(
              color: context.colorPalette.greyF2F,
              borderRadius: BorderRadius.circular(kRadiusSecondary),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontFamily: GoogleFonts.cairo().fontFamily!),
                    children: [
                      TextSpan(
                        text: "قام",
                        style: TextStyle(
                          color: context.colorPalette.black001,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: " أحمد محمد ",
                        style: TextStyle(
                          color: context.colorPalette.grey708,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "بـ إرسال طلب تزويد كمية 200",
                        style: TextStyle(
                          color: context.colorPalette.black001,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          const CustomSvg(MyIcons.eye),
                          const SizedBox(width: 5),
                          Text(
                            "عرض العملية",
                            style: TextStyle(
                              color: context.colorPalette.black001,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "08:13:51 صباحاً - 01-03-2025",
                      style: TextStyle(
                        color: context.colorPalette.grey666,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
