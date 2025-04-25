// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      branchId: json['branchId'] as String,
      user: LightUserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'name': instance.name,
      'branchId': instance.branchId,
      'user': instance.user.toJson(),
    };

_$LightCategoryModelImpl _$$LightCategoryModelImplFromJson(
  Map<String, dynamic> json,
) => _$LightCategoryModelImpl(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
);

Map<String, dynamic> _$$LightCategoryModelImplToJson(
  _$LightCategoryModelImpl instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
