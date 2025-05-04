// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(
  Map<String, dynamic> json,
) => _$TaskModelImpl(
  createdAt: const TimestampSerializer().fromJson(json['createdAt']),
  startTime: const TimestampSerializer().fromJson(json['startTime']),
  endTime: const TimestampSerializer().fromJson(json['endTime']),
  id: json['id'] as String? ?? "",
  title: json['title'] as String? ?? "",
  description: json['description'] as String? ?? "",
  status: json['status'] as String? ?? "",
  completedDuration: (json['completedDuration'] as num?)?.toDouble() ?? 0.0,
  hasSubTasks: json['hasSubTasks'] as bool? ?? false,
  employee:
      json['employee'] == null
          ? null
          : LightUserModel.fromJson(json['employee'] as Map<String, dynamic>),
  createdBy: LightUserModel.fromJson(json['createdBy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'startTime': const TimestampSerializer().toJson(instance.startTime),
      'endTime': const TimestampSerializer().toJson(instance.endTime),
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'completedDuration': instance.completedDuration,
      'hasSubTasks': instance.hasSubTasks,
      'employee': instance.employee?.toJson(),
      'createdBy': instance.createdBy.toJson(),
    };
