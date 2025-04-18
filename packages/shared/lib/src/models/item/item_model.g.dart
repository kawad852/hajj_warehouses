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
      minimumQuantity:
          (json['minimumQuantity'] as num?)?.toInt() ?? kItemLimitThreshold,
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
      'minimumQuantity': instance.minimumQuantity,
    };

_$LightItemModelImpl _$$LightItemModelImplFromJson(Map<String, dynamic> json) =>
    _$LightItemModelImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      quantity: json['quantity'] as String? ?? '',
    );

Map<String, dynamic> _$$LightItemModelImplToJson(
  _$LightItemModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'quantity': instance.quantity,
};
