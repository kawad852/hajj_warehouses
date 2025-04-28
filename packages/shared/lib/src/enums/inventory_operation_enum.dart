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
