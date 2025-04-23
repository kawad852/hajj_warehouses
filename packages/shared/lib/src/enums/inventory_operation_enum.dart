enum OperationType {
  create('CREATE'),
  add('Add'),
  withdraw('WITHDRAW'),
  supply('SUPPLY'),
  transfer('TRANSFER'),
  destroy('DESTROY');

  final String value;

  const OperationType(this.value);
}
