// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OperationModelImpl _$$OperationModelImplFromJson(Map<String, dynamic> json) =>
    _$OperationModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
    );

Map<String, dynamic> _$$OperationModelImplToJson(
  _$OperationModelImpl instance,
) => <String, dynamic>{
  'createdAt': const TimestampSerializer().toJson(instance.createdAt),
  'id': instance.id,
  'type': instance.type,
  'displayName': instance.displayName,
};
