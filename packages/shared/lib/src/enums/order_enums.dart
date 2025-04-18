enum OrderStatusEnum {
  placed('PLACED'),
  preparing('APPROVED'),
  inDelivery('IN-DELIVERY'),
  rejected('REJECTED'),
  completed('COMPLETED'),
  canceled('CANCELED');

  final String value;

  const OrderStatusEnum(this.value);
}
