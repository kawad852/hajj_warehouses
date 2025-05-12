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
  startedAt: const TimestampSerializer().fromJson(json['startedAt']),
  endedAt: const TimestampSerializer().fromJson(json['endedAt']),
  id: json['id'] as String? ?? "",
  title: json['title'] as String? ?? "",
  description: json['description'] as String? ?? "",
  status: json['status'] as String? ?? "",
  totalSubTasks: (json['totalSubTasks'] as num?)?.toInt() ?? 0,
  completedSubTasksCount:
      (json['completedSubTasksCount'] as num?)?.toInt() ?? 0,
  startedLate: json['startedLate'] as bool? ?? false,
  endedLate: json['endedLate'] as bool? ?? false,
  employee:
      json['employee'] == null
          ? null
          : LightUserModel.fromJson(json['employee'] as Map<String, dynamic>),
  branch: LightBranchModel.fromJson(json['branch'] as Map<String, dynamic>),
  createdBy: LightUserModel.fromJson(json['createdBy'] as Map<String, dynamic>),
  startingImages:
      (json['startingImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  endingImages:
      (json['endingImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'startTime': const TimestampSerializer().toJson(instance.startTime),
      'endTime': const TimestampSerializer().toJson(instance.endTime),
      'startedAt': const TimestampSerializer().toJson(instance.startedAt),
      'endedAt': const TimestampSerializer().toJson(instance.endedAt),
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'totalSubTasks': instance.totalSubTasks,
      'completedSubTasksCount': instance.completedSubTasksCount,
      'startedLate': instance.startedLate,
      'endedLate': instance.endedLate,
      'employee': instance.employee?.toJson(),
      'branch': instance.branch.toJson(),
      'createdBy': instance.createdBy.toJson(),
      'startingImages': instance.startingImages,
      'endingImages': instance.endingImages,
    };
