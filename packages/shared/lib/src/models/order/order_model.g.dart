// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
      branchId: json['branchId'] as String,
      user: LightUserModel.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as String,
      operation:
          json['operation'] == null
              ? null
              : InventoryOperationModel.fromJson(
                json['operation'] as Map<String, dynamic>,
              ),
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
      orderRecords:
          (json['orderRecords'] as List<dynamic>?)
              ?.map((e) => OrderRecordModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'branchId': instance.branchId,
      'user': instance.user.toJson(),
      'status': instance.status,
      'operation': instance.operation?.toJson(),
      'transferFromBranch': instance.transferFromBranch?.toJson(),
      'transferToBranch': instance.transferToBranch?.toJson(),
      'orderRecords': instance.orderRecords.map((e) => e.toJson()).toList(),
    };

_$OrderRecordModelImpl _$$OrderRecordModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrderRecordModelImpl(
  time: const TimestampSerializer().fromJson(json['time']),
  status: json['status'] as String,
  user: LightUserModel.fromJson(json['user'] as Map<String, dynamic>),
  branchId: json['branchId'] as String,
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$OrderRecordModelImplToJson(
  _$OrderRecordModelImpl instance,
) => <String, dynamic>{
  'time': const TimestampSerializer().toJson(instance.time),
  'status': instance.status,
  'user': instance.user.toJson(),
  'branchId': instance.branchId,
  'images': instance.images,
};
