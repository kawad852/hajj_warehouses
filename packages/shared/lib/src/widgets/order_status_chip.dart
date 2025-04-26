import 'package:shared/shared.dart';

class OrderStatusChip extends StatelessWidget {
  final String status;

  const OrderStatusChip({super.key, required this.status});

  String getLabel(BuildContext context) {
    if (status == OrderStatusEnum.placed.value) {
      return "بالإنتظار";
    } else if (status == OrderStatusEnum.inDelivery.value) {
      return "جاري التوصيل";
    } else if (status == OrderStatusEnum.approved.value) {
      return "مقبول";
    } else if (status == OrderStatusEnum.rejected.value) {
      return "مرفوض";
    } else if (status == OrderStatusEnum.canceled.value) {
      return "ملغى";
    }
    return 'تم الإستلام';
  }

  @override
  Widget build(BuildContext context) {
    final label = getLabel(context);
    return Container(
      height: 25,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: context.colorPalette.yellowC39,
        borderRadius: BorderRadius.circular(kRadiusPrimary),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: context.colorPalette.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
