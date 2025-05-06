// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get startTime => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set startTime(DateTime? value) => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get endTime => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set endTime(DateTime? value) => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get endedAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set endedAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  double get completedDuration => throw _privateConstructorUsedError;
  set completedDuration(double value) =>
      throw _privateConstructorUsedError; // in minutes
  int get totalSubTasks => throw _privateConstructorUsedError; // in minutes
  set totalSubTasks(int value) => throw _privateConstructorUsedError;
  int get completedSubTasksCount => throw _privateConstructorUsedError;
  set completedSubTasksCount(int value) => throw _privateConstructorUsedError;
  LightUserModel? get employee => throw _privateConstructorUsedError;
  set employee(LightUserModel? value) => throw _privateConstructorUsedError;
  LightUserModel get createdBy => throw _privateConstructorUsedError;
  set createdBy(LightUserModel value) => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  set images(List<String> value) => throw _privateConstructorUsedError;

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? startTime,
    @TimestampSerializer() DateTime? endTime,
    @TimestampSerializer() DateTime? endedAt,
    String id,
    String title,
    String description,
    String status,
    double completedDuration,
    int totalSubTasks,
    int completedSubTasksCount,
    LightUserModel? employee,
    LightUserModel createdBy,
    List<String> images,
  });

  $LightUserModelCopyWith<$Res>? get employee;
  $LightUserModelCopyWith<$Res> get createdBy;
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? endedAt = freezed,
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? completedDuration = null,
    Object? totalSubTasks = null,
    Object? completedSubTasksCount = null,
    Object? employee = freezed,
    Object? createdBy = null,
    Object? images = null,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            startTime:
                freezed == startTime
                    ? _value.startTime
                    : startTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            endTime:
                freezed == endTime
                    ? _value.endTime
                    : endTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            endedAt:
                freezed == endedAt
                    ? _value.endedAt
                    : endedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            completedDuration:
                null == completedDuration
                    ? _value.completedDuration
                    : completedDuration // ignore: cast_nullable_to_non_nullable
                        as double,
            totalSubTasks:
                null == totalSubTasks
                    ? _value.totalSubTasks
                    : totalSubTasks // ignore: cast_nullable_to_non_nullable
                        as int,
            completedSubTasksCount:
                null == completedSubTasksCount
                    ? _value.completedSubTasksCount
                    : completedSubTasksCount // ignore: cast_nullable_to_non_nullable
                        as int,
            employee:
                freezed == employee
                    ? _value.employee
                    : employee // ignore: cast_nullable_to_non_nullable
                        as LightUserModel?,
            createdBy:
                null == createdBy
                    ? _value.createdBy
                    : createdBy // ignore: cast_nullable_to_non_nullable
                        as LightUserModel,
            images:
                null == images
                    ? _value.images
                    : images // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightUserModelCopyWith<$Res>? get employee {
    if (_value.employee == null) {
      return null;
    }

    return $LightUserModelCopyWith<$Res>(_value.employee!, (value) {
      return _then(_value.copyWith(employee: value) as $Val);
    });
  }

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightUserModelCopyWith<$Res> get createdBy {
    return $LightUserModelCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
    _$TaskModelImpl value,
    $Res Function(_$TaskModelImpl) then,
  ) = __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? startTime,
    @TimestampSerializer() DateTime? endTime,
    @TimestampSerializer() DateTime? endedAt,
    String id,
    String title,
    String description,
    String status,
    double completedDuration,
    int totalSubTasks,
    int completedSubTasksCount,
    LightUserModel? employee,
    LightUserModel createdBy,
    List<String> images,
  });

  @override
  $LightUserModelCopyWith<$Res>? get employee;
  @override
  $LightUserModelCopyWith<$Res> get createdBy;
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
    _$TaskModelImpl _value,
    $Res Function(_$TaskModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? endedAt = freezed,
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? completedDuration = null,
    Object? totalSubTasks = null,
    Object? completedSubTasksCount = null,
    Object? employee = freezed,
    Object? createdBy = null,
    Object? images = null,
  }) {
    return _then(
      _$TaskModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        startTime:
            freezed == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        endTime:
            freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        endedAt:
            freezed == endedAt
                ? _value.endedAt
                : endedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        completedDuration:
            null == completedDuration
                ? _value.completedDuration
                : completedDuration // ignore: cast_nullable_to_non_nullable
                    as double,
        totalSubTasks:
            null == totalSubTasks
                ? _value.totalSubTasks
                : totalSubTasks // ignore: cast_nullable_to_non_nullable
                    as int,
        completedSubTasksCount:
            null == completedSubTasksCount
                ? _value.completedSubTasksCount
                : completedSubTasksCount // ignore: cast_nullable_to_non_nullable
                    as int,
        employee:
            freezed == employee
                ? _value.employee
                : employee // ignore: cast_nullable_to_non_nullable
                    as LightUserModel?,
        createdBy:
            null == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                    as LightUserModel,
        images:
            null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TaskModelImpl implements _TaskModel {
  _$TaskModelImpl({
    @TimestampSerializer() this.createdAt,
    @TimestampSerializer() this.startTime,
    @TimestampSerializer() this.endTime,
    @TimestampSerializer() this.endedAt,
    this.id = "",
    this.title = "",
    this.description = "",
    this.status = "",
    this.completedDuration = 0.0,
    this.totalSubTasks = 0,
    this.completedSubTasksCount = 0,
    this.employee,
    required this.createdBy,
    this.images = const [],
  });

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @TimestampSerializer()
  DateTime? startTime;
  @override
  @TimestampSerializer()
  DateTime? endTime;
  @override
  @TimestampSerializer()
  DateTime? endedAt;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String title;
  @override
  @JsonKey()
  String description;
  @override
  @JsonKey()
  String status;
  @override
  @JsonKey()
  double completedDuration;
  // in minutes
  @override
  @JsonKey()
  int totalSubTasks;
  @override
  @JsonKey()
  int completedSubTasksCount;
  @override
  LightUserModel? employee;
  @override
  LightUserModel createdBy;
  @override
  @JsonKey()
  List<String> images;

  @override
  String toString() {
    return 'TaskModel(createdAt: $createdAt, startTime: $startTime, endTime: $endTime, endedAt: $endedAt, id: $id, title: $title, description: $description, status: $status, completedDuration: $completedDuration, totalSubTasks: $totalSubTasks, completedSubTasksCount: $completedSubTasksCount, employee: $employee, createdBy: $createdBy, images: $images)';
  }

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(this);
  }
}

abstract class _TaskModel implements TaskModel {
  factory _TaskModel({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? startTime,
    @TimestampSerializer() DateTime? endTime,
    @TimestampSerializer() DateTime? endedAt,
    String id,
    String title,
    String description,
    String status,
    double completedDuration,
    int totalSubTasks,
    int completedSubTasksCount,
    LightUserModel? employee,
    required LightUserModel createdBy,
    List<String> images,
  }) = _$TaskModelImpl;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  @TimestampSerializer()
  DateTime? get startTime;
  @TimestampSerializer()
  set startTime(DateTime? value);
  @override
  @TimestampSerializer()
  DateTime? get endTime;
  @TimestampSerializer()
  set endTime(DateTime? value);
  @override
  @TimestampSerializer()
  DateTime? get endedAt;
  @TimestampSerializer()
  set endedAt(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  String get title;
  set title(String value);
  @override
  String get description;
  set description(String value);
  @override
  String get status;
  set status(String value);
  @override
  double get completedDuration;
  set completedDuration(double value); // in minutes
  @override
  int get totalSubTasks; // in minutes
  set totalSubTasks(int value);
  @override
  int get completedSubTasksCount;
  set completedSubTasksCount(int value);
  @override
  LightUserModel? get employee;
  set employee(LightUserModel? value);
  @override
  LightUserModel get createdBy;
  set createdBy(LightUserModel value);
  @override
  List<String> get images;
  set images(List<String> value);

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
