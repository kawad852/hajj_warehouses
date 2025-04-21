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
  displayName: json['displayName'] as String? ?? '',
  notes: json['notes'] as String?,
  destroyReason: json['destroyReason'] as String?,
  operationType: json['operationType'] as String,
  supplyType: json['supplyType'] as String?,
  totalPayment: (json['totalPayment'] as num?)?.toDouble() ?? 0.0,
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => LightItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$InventoryOperationModelImplToJson(
  _$InventoryOperationModelImpl instance,
) => <String, dynamic>{
  'createdAt': const TimestampSerializer().toJson(instance.createdAt),
  'id': instance.id,
  'displayName': instance.displayName,
  'notes': instance.notes,
  'destroyReason': instance.destroyReason,
  'operationType': instance.operationType,
  'supplyType': instance.supplyType,
  'totalPayment': instance.totalPayment,
  'quantity': instance.quantity,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'images': instance.images,
};
