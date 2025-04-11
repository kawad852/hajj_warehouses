import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@unfreezed
class ReviewModel with _$ReviewModel {
  factory ReviewModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? comment,
    @Default(5) double rating,
    String? userId,
    String? displayName,
    String? photoURL,
    @Default(false) bool published,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);
}
