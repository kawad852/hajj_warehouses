// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemModelImpl _$$ItemModelImplFromJson(Map<String, dynamic> json) =>
    _$ItemModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      categoryId: json['categoryId'] as String? ?? '',
      status: json['status'] as String? ?? '',
      availableQuantity: (json['availableQuantity'] as num?)?.toInt() ?? 0,
      stockQuantity: (json['stockQuantity'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ItemModelImplToJson(_$ItemModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'status': instance.status,
      'availableQuantity': instance.availableQuantity,
      'stockQuantity': instance.stockQuantity,
    };
