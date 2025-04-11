import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';
import '../../helper/ui_helper.dart';
import '../../utils/app_constants.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@unfreezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String nameEn,
    @Default('') String nameAr,
    @Default('') String thumbnail,
    @Default([]) List<String> parentCategoryIds,
    @Default(kOrder) int order,
    @Default(true) bool published,
    @Default(false) bool showOnHome,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  CategoryModel._();

  String get name {
    return UiHelper.translate(
      textEN: nameEn,
      textAR: nameAr,
    );
  }
}
