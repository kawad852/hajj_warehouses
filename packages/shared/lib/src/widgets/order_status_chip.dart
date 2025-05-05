import 'package:shared/shared.dart';

class OrderStatusChip extends StatelessWidget {
  final String status;

  const OrderStatusChip({super.key, required this.status});

  (String, Color) getLabel(BuildContext context) {
    if (status == OrderStatusEnum.placed.value) {
      return (context.appLocalization.pending, context.colorPalette.yellow600);
    } else if (status == OrderStatusEnum.inDelivery.value) {
      return (context.appLocalization.beingDelivered, context.colorPalette.yellow600);
    } else if (status == OrderStatusEnum.approved.value) {
      return (context.appLocalization.accepted, context.colorPalette.primary);
    } else if (status == OrderStatusEnum.rejected.value) {
      return (context.appLocalization.rejected, context.colorPalette.redC10);
    } else if (status == OrderStatusEnum.canceled.value) {
      return (context.appLocalization.cancelled, context.colorPalette.redC10);
    }
    return (context.appLocalization.received, context.colorPalette.primary);
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
