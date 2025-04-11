// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryModelImpl _$$CountryModelImplFromJson(Map<String, dynamic> json) =>
    _$CountryModelImpl(
      id: json['id'] as String?,
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      code: json['code'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      dialCode: json['dialCode'] as String?,
    );

Map<String, dynamic> _$$CountryModelImplToJson(_$CountryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'code': instance.code,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'dialCode': instance.dialCode,
    };
