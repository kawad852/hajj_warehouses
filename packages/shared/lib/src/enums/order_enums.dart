enum OrderStatusEnum {
  placed('PLACED'),
  approved('APPROVED'),
  inDelivery('IN-DELIVERY'),
  rejected('REJECTED'),
  completed('COMPLETED'),
  canceled('CANCELED');

  final String value;

  const OrderStatusEnum(this.value);
}
