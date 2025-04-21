enum OperationType {
  create('CREATE'),
  add('Add'),
  withdraw('WITHDRAW'),
  supply('SUPPLY'),
  destroy('DESTROY');

  final String value;

  const OperationType(this.value);
}
