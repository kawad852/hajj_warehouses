enum OperationsType {
  add('Add'),
  withdraw('WITHDRAW'),
  supply('SUPPLY'),
  destroy('DESTROY');

  final String value;

  const OperationsType(this.value);
}
