// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProviderModelImpl _$$ProviderModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProviderModelImpl(
  createdAt: const TimestampSerializer().fromJson(json['createdAt']),
  id: json['id'] as String? ?? "",
  nameEn: json['nameEn'] as String? ?? "",
  nameAr: json['nameAr'] as String? ?? "",
  descriptionEn: json['descriptionEn'] as String? ?? "",
  descriptionAr: json['descriptionAr'] as String? ?? "",
  stateId: json['stateId'] as String? ?? "",
  cityId: json['cityId'] as String? ?? "",
  address: json['address'] as String? ?? "",
  status: json['status'] as String? ?? "PENDING",
  type: json['type'] as String? ?? "",
  thumbnail: json['thumbnail'] as String? ?? "",
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  phoneNumber: json['phoneNumber'] as String?,
  phoneCountryCode: json['phoneCountryCode'] as String? ?? kFallBackCountryCode,
);

Map<String, dynamic> _$$ProviderModelImplToJson(_$ProviderModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
      'stateId': instance.stateId,
      'cityId': instance.cityId,
      'address': instance.address,
      'status': instance.status,
      'type': instance.type,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
      'phoneNumber': instance.phoneNumber,
      'phoneCountryCode': instance.phoneCountryCode,
    };
