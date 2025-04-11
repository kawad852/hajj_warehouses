import '../models/basket/basket_model.dart';
import '../models/store/store_model.dart';
import '../utils/app_constants.dart';

class BasketHelper {
  static (double basePrice, double? discountPrice) calculatePrice({
    required double basePrice,
    required double discountPrice,
    required List<MealOptionModel> items,
  }) {
    var extraPrice = 0.0;
    for (var element in items) {
      final requiredItems = element.items.where((e) => e.id == element.selectedId).toList();
      for (var item in requiredItems) {
        extraPrice = extraPrice + item.price;
      }
      final optionalItems = element.items.where((e) => element.selectedIds.contains(e.id)).toList();
      for (var item in optionalItems) {
        extraPrice = extraPrice + item.price;
      }
    }
    return (basePrice + extraPrice, discountPrice != kOfferPrice ? (discountPrice + extraPrice) : null);
  }

  static (double total, double totalAfterDiscount) calculateBasketTotal(
    List<BasketModel> basket, {
    double? percent,
    double? amount,
  }) {
    final total = basket.fold(0.0, (sum, element) {
      final meal = element.product!;
      final price = meal.price;
      return sum + (price.$2 ?? price.$1) * element.product!.basketQuantity;
    });
    final totalAfterDiscount = total - (amount ?? (total * (percent ?? 0.0) / 100));
    return (total, totalAfterDiscount);
  }
}
