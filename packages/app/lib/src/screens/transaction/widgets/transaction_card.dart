import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final bool isRTL = Localizations.localeOf(context).languageCode == LanguageEnum.arabic;
    final isDeposit = transaction.transactionType == TransactionType.deposit.value;
    final style = TextStyle(
      fontFamily: GoogleFonts.cairo().fontFamily!,
      color: context.colorPalette.black001,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    final greenStyle = style.copyWith(color: context.colorPalette.primary);
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
                      if (isRTL) TextSpan(text: "قام", style: style),
                      TextSpan(text: " ${transaction.user.displayName} ", style: greenStyle),
                      TextSpan(
                        text:
                            "${isRTL ? "بـ" : ""} ${isDeposit ? context.appLocalization.add : context.appLocalization.withdraw} ",
                        style: style,
                      ),
                      TextSpan(
                        text: "${transaction.amount} ${context.appLocalization.riyal}",
                        style: style,
                      ),
                      if (transaction.expenseType != null)
                        TextSpan(
                          text:
                              " ${expenses.firstWhere((e) => e.id == transaction.expenseType).nameAr}",
                          style: greenStyle,
                        ),
                      if (transaction.operationId != null)
                        TextSpan(
                          text:
                              " ${context.appLocalization.againstPurchaseOrder}: ${transaction.operationId}",
                          style: style,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.navigate((context) {
                          return OperationDetailsScreen(
                            operation: null,
                            operationId: transaction.operationId!,
                          );
                        });
                      },
                      child: Row(
                        children: [
                          const CustomSvg(MyIcons.eye),
                          const SizedBox(width: 5),
                          Text(
                            context.appLocalization.viewOperation,
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
