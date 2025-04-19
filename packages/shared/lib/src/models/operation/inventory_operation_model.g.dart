// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_operation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryOperationModelImpl _$$InventoryOperationModelImplFromJson(
  Map<String, dynamic> json,
) => _$InventoryOperationModelImpl(
  createdAt: const TimestampSerializer().fromJson(json['createdAt']),
  id: json['id'] as String? ?? '',
  type: json['type'] as String? ?? '',
  displayName: json['displayName'] as String? ?? '',
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => LightItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$InventoryOperationModelImplToJson(
  _$InventoryOperationModelImpl instance,
) => <String, dynamic>{
  'createdAt': const TimestampSerializer().toJson(instance.createdAt),
  'id': instance.id,
  'type': instance.type,
  'displayName': instance.displayName,
  'items': instance.items,
};
