import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';
import '../store/store_model.dart';

part 'basket_model.freezed.dart';
part 'basket_model.g.dart';

@unfreezed
class BasketModel with _$BasketModel {
  factory BasketModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String storeId,
    ProductModel? product,
  }) = _BasketModel;

  factory BasketModel.fromJson(Map<String, dynamic> json) => _$BasketModelFromJson(json);
}
