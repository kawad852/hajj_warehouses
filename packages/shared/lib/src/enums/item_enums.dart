enum ItemStatusEnum {
  lowStock('LOW-STOCK'),
  outOfStock('OUT-OF-STOCK'),
  inStock('IN-STOCK');

  final String value;

  const ItemStatusEnum(this.value);
}
