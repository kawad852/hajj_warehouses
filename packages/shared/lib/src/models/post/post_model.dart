import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@unfreezed
class PostModel with _$PostModel {
  factory PostModel({
    @TimestampSerializer() required DateTime createdAt,
    @Default('') String id,
    @Default('') String nameEn,
    @Default('') String nameAr,
    @Default('') String type,
    @Default(PostData()) PostData item,
    @Default([]) List<PostData> items, //carousel
    @Default(0) int order,
    @Default(true) bool published,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}

@unfreezed
class PostData with _$PostData {
  const factory PostData({
    @Default('') String thumbnail,
    @Default([]) List<String> categoryIds,
  }) = _PostData;

  factory PostData.fromJson(Map<String, dynamic> json) => _$PostDataFromJson(json);
}
