import 'package:shared/shared.dart';

class HomeBubble extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final bool expandedTask;
  final String? task;
  final String? value;
  final String? valueIcon;
  final Color? valueColor;
  final Color? taskColor;
  final String? prefixIcon;

  const HomeBubble({
    super.key,
    required this.title,
    required this.onTap,
    this.task,
    this.value,
    this.valueIcon,
    this.valueColor,
    this.prefixIcon,
    this.taskColor,
    this.expandedTask = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF2F,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  if (prefixIcon != null)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 5),
                      child: CustomSvg(prefixIcon!),
                    ),
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.grey666,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
            if (task != null) Divider(color: context.colorPalette.greyC4C),
            if (task != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task!,
                      overflow: expandedTask ? null : TextOverflow.ellipsis,
                      style: TextStyle(
                        color: taskColor ?? context.colorPalette.black001,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (value != null) const SizedBox(height: 8),
                    if (value != null)
                      Row(
                        children: [
                          CustomSvg(valueIcon!),
                          const SizedBox(width: 5),
                          Text(
                            value!,
                            style: TextStyle(
                              color: valueColor ?? context.colorPalette.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
