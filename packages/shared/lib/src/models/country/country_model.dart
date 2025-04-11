import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@unfreezed
class CountryModel with _$CountryModel {
  factory CountryModel({
    String? id,
    @TimestampSerializer() DateTime? createdAt,
    String? code,
    String? nameEn,
    String? nameAr,
    String? dialCode,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);
}
