import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@unfreezed
class TaskModel with _$TaskModel {
  @JsonSerializable(explicitToJson: true)
  factory TaskModel({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? startTime,
    @TimestampSerializer() DateTime? endTime,
    @TimestampSerializer() DateTime? startedAt,
    @TimestampSerializer() DateTime? endedAt,
    @Default("") String id,
    @Default("") String title,
    @Default("") String description,
    @Default("") String status,
    @Default(0) int totalSubTasks,
    @Default(0) int completedSubTasksCount,
    @Default(false) bool markAsLate,
    LightUserModel? employee,
    required LightUserModel createdBy,
    @Default([]) List<String> images,
  }) = _TaskModel;
  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
}
