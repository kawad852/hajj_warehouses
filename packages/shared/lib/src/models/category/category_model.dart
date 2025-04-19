import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@unfreezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String name,
    @Default('') String thumbnail,
    @Default([]) List<String> parentCategoryIds,
    @Default(kOrder) int order,
    @Default(true) bool published,
    @Default(false) bool showOnHome,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  CategoryModel._();

  Future<String> getId() async => RowIdHelper.getOrderId(RowIdHelper.orderId);
}

@unfreezed
class LightCategoryModel with _$LightCategoryModel {
  factory LightCategoryModel({@Default('') String id, @Default('') String name}) =
      _LightCategoryModel;

  factory LightCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$LightCategoryModelFromJson(json);
}
