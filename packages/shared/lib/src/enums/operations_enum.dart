enum OperationType {
  category('CATEGORY'),
  item('ITEM'),
  order('ORDER'),
  transfer('TRANSFER');

  final String value;

  const OperationType(this.value);
}

enum CategoryOperationType {
  add('Add'),
  withdraw('WITHDRAW'),
  supply('SUPPLY'),
  destroy('DESTROY');

  final String value;

  const CategoryOperationType(this.value);
}
