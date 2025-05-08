// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
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
      branch: LightBranchModel.fromJson(json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'user': instance.user.toJson(),
      'status': instance.status,
      'operation': instance.operation?.toJson(),
      'transferFromBranch': instance.transferFromBranch?.toJson(),
      'transferToBranch': instance.transferToBranch?.toJson(),
      'branch': instance.branch.toJson(),
    };

_$OrderHistoryModelImpl _$$OrderHistoryModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrderHistoryModelImpl(
  time: const TimestampSerializer().fromJson(json['time']),
  status: json['status'] as String,
  user: LightUserModel.fromJson(json['user'] as Map<String, dynamic>),
  branch: LightBranchModel.fromJson(json['branch'] as Map<String, dynamic>),
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$OrderHistoryModelImplToJson(
  _$OrderHistoryModelImpl instance,
) => <String, dynamic>{
  'time': const TimestampSerializer().toJson(instance.time),
  'status': instance.status,
  'user': instance.user.toJson(),
  'branch': instance.branch.toJson(),
  'images': instance.images,
};
