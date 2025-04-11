import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';
import '../../models/basket/basket_model.dart';
import '../../models/promo_code/promo_code_model.dart';
import '../../models/user/user_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@unfreezed
class OrderModel with _$OrderModel {
  factory OrderModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? paymentMethod,
    @Default("DELIVERY") String type,
    List<BasketModel>? basket,
    PromoCodeModel? promoCode,
    @Default("PLACED") String status,
    double? basketTotal,
    @Default(0.0) double deliveryFee,
    double? discount,
    double? orderTotal,
    @Default(false) bool reviewed,
    UserModel? user,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
}
