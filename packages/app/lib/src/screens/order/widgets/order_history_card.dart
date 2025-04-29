import 'package:shared/shared.dart';
import 'package:shared/src/widgets/base_card.dart';

class OrderHistoryCard extends StatelessWidget {
  final OrderHistoryModel history;

  const OrderHistoryCard({super.key, required this.history});

  (String, String) _getLabels(BuildContext context) {
    final status = OrderStatusEnum.values.firstWhere((e) => e.value == history.status);
    const orderLabel = "الطلب";
    switch (status) {
      case OrderStatusEnum.placed:
        return ("إرسال", orderLabel);
      case OrderStatusEnum.approved:
        return ("الموافقة على", orderLabel);
      case OrderStatusEnum.inDelivery:
        return ("إرسال", '$orderLabel الى التوصيل');
      case OrderStatusEnum.rejected:
        return ("رفض", orderLabel);
      case OrderStatusEnum.canceled:
        return ("إلغاء", orderLabel);
      case OrderStatusEnum.completed:
        return ("إستلام", orderLabel);
    }
  }

  @override
  Widget build(BuildContext context) {
    final labels = _getLabels(context);
    return BaseCard(
      displayName: history.user.displayName!,
      action1: labels.$1,
      action2: labels.$2,
      date: history.time!,
    );
  }
}
