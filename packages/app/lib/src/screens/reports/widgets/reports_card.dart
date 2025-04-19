import 'package:shared/shared.dart';

class ReportsCard extends StatelessWidget {
  final String icon;
  final String title;
  final String suffixText;
  final void Function() onTapSuffix;
  const ReportsCard({
    super.key,
    required this.icon,
    required this.title,
    required this.suffixText,
    required this.onTapSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF2F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Row(
        children: [
          CustomSvg(icon, width: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: context.colorPalette.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          InkWell(
            onTap: onTapSuffix,
            child: Text(
              suffixText,
              style: TextStyle(
                color: context.colorPalette.grey708,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
