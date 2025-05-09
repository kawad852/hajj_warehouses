// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoleModelImpl _$$RoleModelImplFromJson(Map<String, dynamic> json) =>
    _$RoleModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      initialLocation: json['initialLocation'] as String?,
      analytics: json['analytics'] as bool? ?? false,
      permissions:
          (json['permissions'] as List<dynamic>?)
              ?.map((e) => PermissionModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$RoleModelImplToJson(_$RoleModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'initialLocation': instance.initialLocation,
      'analytics': instance.analytics,
      'permissions': instance.permissions,
    };
