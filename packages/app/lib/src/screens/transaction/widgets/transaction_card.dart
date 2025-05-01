import 'package:shared/shared.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isDeposit = transaction.transactionType == TransactionType.deposit.value;
    final style = TextStyle(
      fontFamily: GoogleFonts.cairo().fontFamily!,
      color: context.colorPalette.black001,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    final greenStyle = style.copyWith(color: context.colorPalette.grey708);
    return Row(
      children: [
        CustomSvg(isDeposit ? MyIcons.addSquare : MyIcons.minusSquare),
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
                    style: style,
                    children: [
                      TextSpan(text: "قام", style: style),
                      TextSpan(text: " ${transaction.user.displayName} ", style: greenStyle),
                      TextSpan(text: "بـ ${isDeposit ? "إضافة" : "سحب"} ", style: style),
                      TextSpan(text: "${transaction.amount} ريال", style: style),
                      if (transaction.expenseType != null)
                        TextSpan(text: " ${transaction.expenseType}", style: greenStyle),
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
                      context.defaultDateFormat(transaction.createdAt),
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
