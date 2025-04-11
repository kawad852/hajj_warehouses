// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PolicyModelImpl _$$PolicyModelImplFromJson(Map<String, dynamic> json) =>
    _$PolicyModelImpl(
      id: json['id'] as String? ?? '',
      contentEn: json['contentEn'] as String? ?? '',
      contentAr: json['contentAr'] as String? ?? '',
      titleEn: json['titleEn'] as String? ?? '',
      titleAr: json['titleAr'] as String? ?? '',
    );

Map<String, dynamic> _$$PolicyModelImplToJson(_$PolicyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contentEn': instance.contentEn,
      'contentAr': instance.contentAr,
      'titleEn': instance.titleEn,
      'titleAr': instance.titleAr,
    };
