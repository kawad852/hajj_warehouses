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
  endedAt: const TimestampSerializer().fromJson(json['endedAt']),
  id: json['id'] as String? ?? "",
  title: json['title'] as String? ?? "",
  description: json['description'] as String? ?? "",
  status: json['status'] as String? ?? "",
  completedDuration: (json['completedDuration'] as num?)?.toDouble() ?? 0.0,
  totalSubTasks: (json['totalSubTasks'] as num?)?.toInt() ?? 0,
  completedSubTasksCount:
      (json['completedSubTasksCount'] as num?)?.toInt() ?? 0,
  employee:
      json['employee'] == null
          ? null
          : LightUserModel.fromJson(json['employee'] as Map<String, dynamic>),
  createdBy: LightUserModel.fromJson(json['createdBy'] as Map<String, dynamic>),
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'startTime': const TimestampSerializer().toJson(instance.startTime),
      'endTime': const TimestampSerializer().toJson(instance.endTime),
      'endedAt': const TimestampSerializer().toJson(instance.endedAt),
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'completedDuration': instance.completedDuration,
      'totalSubTasks': instance.totalSubTasks,
      'completedSubTasksCount': instance.completedSubTasksCount,
      'employee': instance.employee?.toJson(),
      'createdBy': instance.createdBy.toJson(),
      'images': instance.images,
    };
