enum MealOptionEnum {
  optional('OPTIONAL'),
  required('REQUIRED');

  final String value;

  const MealOptionEnum(this.value);
}

enum BuildingType {
  house('HOUSE'),
  apartment('APARTMENT'),
  office('OFFICE');

  final String value;

  const BuildingType(this.value);
}

enum AddressPath {
  basketToCheckout('basketToCheckout'),
  back('back');

  final String value;

  const AddressPath(this.value);
}

enum OrderType {
  pickUp('PICKUP'),
  delivery('DELIVERY');

  final String value;

  const OrderType(this.value);
}

enum PaymentMethod {
  cash('CASH'),
  visa('VISA');

  final String value;

  const PaymentMethod(this.value);
}
