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
  user: LightUserModel.fromJson(json['user'] as Map<String, dynamic>),
  branchId: json['branchId'] as String,
  notes: json['notes'] as String?,
  supplyType: json['supplyType'] as String?,
  requestType: json['requestType'] as String?,
  destroyReason: json['destroyReason'] as String?,
  transferFromBranch:
      json['transferFromBranch'] == null
          ? null
          : LightBranchModel.fromJson(
            json['transferFromBranch'] as Map<String, dynamic>,
          ),
  transferToBranch:
      json['transferToBranch'] == null
          ? null
          : LightBranchModel.fromJson(
            json['transferToBranch'] as Map<String, dynamic>,
          ),
  operationType: json['operationType'] as String,
  amount: (json['amount'] as num?)?.toDouble(),
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
);

Map<String, dynamic> _$$InventoryOperationModelImplToJson(
  _$InventoryOperationModelImpl instance,
) => <String, dynamic>{
  'createdAt': const TimestampSerializer().toJson(instance.createdAt),
  'id': instance.id,
  'user': instance.user.toJson(),
  'branchId': instance.branchId,
  'notes': instance.notes,
  'supplyType': instance.supplyType,
  'requestType': instance.requestType,
  'destroyReason': instance.destroyReason,
  'transferFromBranch': instance.transferFromBranch?.toJson(),
  'transferToBranch': instance.transferToBranch?.toJson(),
  'operationType': instance.operationType,
  'amount': instance.amount,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'itemIds': instance.itemIds,
  'images': instance.images,
};
