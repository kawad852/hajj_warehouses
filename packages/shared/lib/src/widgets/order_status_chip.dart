import 'package:shared/shared.dart';

class OrderStatusChip extends StatelessWidget {
  final String status;

  const OrderStatusChip({super.key, required this.status});

  (String, Color) getLabel(BuildContext context) {
    if (status == OrderStatusEnum.placed.value) {
      return ("بالإنتظار", context.colorPalette.yellow600);
    } else if (status == OrderStatusEnum.inDelivery.value) {
      return ("جاري التوصيل", context.colorPalette.yellow600);
    } else if (status == OrderStatusEnum.approved.value) {
      return ("مقبول", context.colorPalette.primary);
    } else if (status == OrderStatusEnum.rejected.value) {
      return ("مرفوض", context.colorPalette.redC10);
    } else if (status == OrderStatusEnum.canceled.value) {
      return ("ملغى", context.colorPalette.redC10);
    }
    return ("تم الإستلام", context.colorPalette.primary);
  }

  @override
  Widget build(BuildContext context) {
    final info = getLabel(context);
    return Container(
      height: 25,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: info.$2,
        borderRadius: BorderRadius.circular(kRadiusPrimary),
      ),
      child: Text(
        info.$1,
        style: TextStyle(
          color: context.colorPalette.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
