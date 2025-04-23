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
  user:
      json['user'] == null
          ? null
          : LightUserModel.fromJson(json['user'] as Map<String, dynamic>),
  notes: json['notes'] as String?,
  supplyType: json['supplyType'] as String?,
  requestType: json['requestType'] as String?,
  destroyReason: json['destroyReason'] as String?,
  operationType: json['operationType'] as String,
  totalPayment: (json['totalPayment'] as num?)?.toDouble() ?? 0.0,
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
  items:
      (json['items'] as List<dynamic>)
          .map((e) => LightItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  itemIds:
      (json['itemIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  orderStatus: json['orderStatus'] as String?,
);

Map<String, dynamic> _$$InventoryOperationModelImplToJson(
  _$InventoryOperationModelImpl instance,
) => <String, dynamic>{
  'createdAt': const TimestampSerializer().toJson(instance.createdAt),
  'id': instance.id,
  'user': instance.user?.toJson(),
  'notes': instance.notes,
  'supplyType': instance.supplyType,
  'requestType': instance.requestType,
  'destroyReason': instance.destroyReason,
  'operationType': instance.operationType,
  'totalPayment': instance.totalPayment,
  'quantity': instance.quantity,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'itemIds': instance.itemIds,
  'images': instance.images,
  'orderStatus': instance.orderStatus,
};
