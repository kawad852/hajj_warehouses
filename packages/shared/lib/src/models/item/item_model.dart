import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';
import '../../helper/ui_helper.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@unfreezed
class ItemModel with _$ItemModel {
  factory ItemModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String nameEn,
    @Default('') String nameAr,
    @Default('') String userId,
    @Default('') String categoryId,
    @Default('') String status,
    @Default(0) int availableQuantity,
    @Default(0) int stockQuantity,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  ItemModel._();

  String get name {
    return UiHelper.translate(textEN: nameEn, textAR: nameAr);
  }
}
