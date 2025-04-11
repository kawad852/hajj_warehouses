import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';
import '../../utils/app_constants.dart';

part 'provider_model.freezed.dart';
part 'provider_model.g.dart';

@unfreezed
class ProviderModel with _$ProviderModel {
  factory ProviderModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default("") String id,
    @Default("") String nameEn,
    @Default("") String nameAr,
    @Default("") String descriptionEn,
    @Default("") String descriptionAr,
    @Default("") String stateId,
    @Default("") String cityId,
    @Default("") String address,
    @Default("PENDING") String status,
    @Default("") String type,
    @Default("") String thumbnail,
    @Default([]) List<String> images,
    String? phoneNumber,
    @Default(kFallBackCountryCode) String phoneCountryCode,
  }) = _ProviderModel;
  factory ProviderModel.fromJson(Map<String, dynamic> json) => _$ProviderModelFromJson(json);
}
