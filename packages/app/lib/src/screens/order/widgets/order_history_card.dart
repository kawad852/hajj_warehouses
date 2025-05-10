import 'package:shared/shared.dart';

class OrderHistoryCard extends StatelessWidget {
  final OrderHistoryModel history;

  const OrderHistoryCard({super.key, required this.history});

  (String, String) _getLabels(BuildContext context) {
    final status = OrderStatusEnum.values.firstWhere((e) => e.value == history.status);
    String orderLabel = context.appLocalization.theOrder;
    switch (status) {
      case OrderStatusEnum.placed:
        return (context.appLocalization.send, orderLabel);
      case OrderStatusEnum.approved:
        return (context.appLocalization.approve, orderLabel);
      case OrderStatusEnum.inDelivery:
        return (context.appLocalization.send, '$orderLabel ${context.appLocalization.toDelivery}');
      case OrderStatusEnum.rejected:
        return (context.appLocalization.reject, orderLabel);
      case OrderStatusEnum.canceled:
        return (context.appLocalization.cancel, orderLabel);
      case OrderStatusEnum.completed:
        return (context.appLocalization.receive, orderLabel);
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
