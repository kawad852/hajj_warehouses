import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@unfreezed
class ItemModel with _$ItemModel {
  factory ItemModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String name,
    @Default('') String userId,
    @Default('') String categoryId,
    @Default('') String status,
    @Default(0) int availableQuantity,
    @Default(0) int minimumQuantity,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);
}

@freezed
class LightItemModel with _$LightItemModel {
  factory LightItemModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String quantity,
  }) = _LightItemModel;

  factory LightItemModel.fromJson(Map<String, dynamic> json) => _$LightItemModelFromJson(json);
}
