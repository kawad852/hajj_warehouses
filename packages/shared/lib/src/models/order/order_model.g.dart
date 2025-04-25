// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
      user:
          json['user'] == null
              ? null
              : LightUserModel.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as String,
      operation:
          json['operation'] == null
              ? null
              : InventoryOperationModel.fromJson(
                json['operation'] as Map<String, dynamic>,
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
      'user': instance.user?.toJson(),
      'status': instance.status,
      'operation': instance.operation?.toJson(),
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
