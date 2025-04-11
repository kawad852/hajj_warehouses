import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'promo_code_model.freezed.dart';
part 'promo_code_model.g.dart';

@unfreezed
class PromoCodeModel with _$PromoCodeModel {
  factory PromoCodeModel({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? expiryDate,
    String? id,
    String? code,
    double? percent,
    double? amount,
    @Default(true) bool active,
  }) = _PromoCodeModel;

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) => _$PromoCodeModelFromJson(json);
}
