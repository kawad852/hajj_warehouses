enum OperationType {
  create('CREATE'),
  add('ADD'),
  withdraw('WITHDRAW'),
  supply('SUPPLY'),
  transfer('TRANSFER'),
  destroy('DESTROY');

  final String value;

  const OperationType(this.value);
}

enum TransactionType {
  deposit('DEPOSIT'),
  withdrawal('WITHDRAWAL');

  final String value;

  const TransactionType(this.value);
}

enum RequestTypeEnum {
  urgent('URGENT'),
  normal('NORMAL');

  final String value;

  const RequestTypeEnum(this.value);
}

enum SupplyTypeEnum {
  selfPurchase('SELF-PURCHASE'),
  orderReceiving('ORDER-RECEIVING');

  final String value;

  const SupplyTypeEnum(this.value);
}

enum DestroyReasonEnum {
  spoiled('SPOILED'),
  badTransportOrStorage('BAD_TRANSPORT_OR_STORAGE');

  final String value;

  const DestroyReasonEnum(this.value);
}
