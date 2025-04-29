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
      categoryId: json['categoryId'] as String? ?? '',
      status: json['status'] as String? ?? '',
      branchId: json['branchId'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      minimumQuantity: (json['minimumQuantity'] as num?)?.toInt() ?? 0,
      user:
          json['user'] == null
              ? null
              : LightUserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ItemModelImplToJson(_$ItemModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'name': instance.name,
      'categoryId': instance.categoryId,
      'status': instance.status,
      'branchId': instance.branchId,
      'quantity': instance.quantity,
      'minimumQuantity': instance.minimumQuantity,
      'user': instance.user?.toJson(),
    };

_$LightItemModelImpl _$$LightItemModelImplFromJson(Map<String, dynamic> json) =>
    _$LightItemModelImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LightItemModelImplToJson(
  _$LightItemModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'quantity': instance.quantity,
};
