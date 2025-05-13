// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) {
  return _RoleModel.fromJson(json);
}

/// @nodoc
mixin _$RoleModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  set nameEn(String? value) => throw _privateConstructorUsedError;
  String? get nameAr => throw _privateConstructorUsedError;
  set nameAr(String? value) => throw _privateConstructorUsedError;
  String? get initialLocation => throw _privateConstructorUsedError;
  set initialLocation(String? value) => throw _privateConstructorUsedError;
  bool get analytics => throw _privateConstructorUsedError;
  set analytics(bool value) => throw _privateConstructorUsedError;
  List<PermissionModel>? get permissions => throw _privateConstructorUsedError;
  set permissions(List<PermissionModel>? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this RoleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoleModelCopyWith<RoleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleModelCopyWith<$Res> {
  factory $RoleModelCopyWith(RoleModel value, $Res Function(RoleModel) then) =
      _$RoleModelCopyWithImpl<$Res, RoleModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? nameEn,
    String? nameAr,
    String? initialLocation,
    bool analytics,
    List<PermissionModel>? permissions,
  });
}

/// @nodoc
class _$RoleModelCopyWithImpl<$Res, $Val extends RoleModel>
    implements $RoleModelCopyWith<$Res> {
  _$RoleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? initialLocation = freezed,
    Object? analytics = null,
    Object? permissions = freezed,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            nameEn:
                freezed == nameEn
                    ? _value.nameEn
                    : nameEn // ignore: cast_nullable_to_non_nullable
                        as String?,
            nameAr:
                freezed == nameAr
                    ? _value.nameAr
                    : nameAr // ignore: cast_nullable_to_non_nullable
                        as String?,
            initialLocation:
                freezed == initialLocation
                    ? _value.initialLocation
                    : initialLocation // ignore: cast_nullable_to_non_nullable
                        as String?,
            analytics:
                null == analytics
                    ? _value.analytics
                    : analytics // ignore: cast_nullable_to_non_nullable
                        as bool,
            permissions:
                freezed == permissions
                    ? _value.permissions
                    : permissions // ignore: cast_nullable_to_non_nullable
                        as List<PermissionModel>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RoleModelImplCopyWith<$Res>
    implements $RoleModelCopyWith<$Res> {
  factory _$$RoleModelImplCopyWith(
    _$RoleModelImpl value,
    $Res Function(_$RoleModelImpl) then,
  ) = __$$RoleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? nameEn,
    String? nameAr,
    String? initialLocation,
    bool analytics,
    List<PermissionModel>? permissions,
  });
}

/// @nodoc
class __$$RoleModelImplCopyWithImpl<$Res>
    extends _$RoleModelCopyWithImpl<$Res, _$RoleModelImpl>
    implements _$$RoleModelImplCopyWith<$Res> {
  __$$RoleModelImplCopyWithImpl(
    _$RoleModelImpl _value,
    $Res Function(_$RoleModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? initialLocation = freezed,
    Object? analytics = null,
    Object? permissions = freezed,
  }) {
    return _then(
      _$RoleModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        nameEn:
            freezed == nameEn
                ? _value.nameEn
                : nameEn // ignore: cast_nullable_to_non_nullable
                    as String?,
        nameAr:
            freezed == nameAr
                ? _value.nameAr
                : nameAr // ignore: cast_nullable_to_non_nullable
                    as String?,
        initialLocation:
            freezed == initialLocation
                ? _value.initialLocation
                : initialLocation // ignore: cast_nullable_to_non_nullable
                    as String?,
        analytics:
            null == analytics
                ? _value.analytics
                : analytics // ignore: cast_nullable_to_non_nullable
                    as bool,
        permissions:
            freezed == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                    as List<PermissionModel>?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RoleModelImpl extends _RoleModel {
  _$RoleModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id,
    this.nameEn,
    this.nameAr,
    this.initialLocation,
    this.analytics = false,
    this.permissions,
  }) : super._();

  factory _$RoleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  String? id;
  @override
  String? nameEn;
  @override
  String? nameAr;
  @override
  String? initialLocation;
  @override
  @JsonKey()
  bool analytics;
  @override
  List<PermissionModel>? permissions;

  @override
  String toString() {
    return 'RoleModel(createdAt: $createdAt, id: $id, nameEn: $nameEn, nameAr: $nameAr, initialLocation: $initialLocation, analytics: $analytics, permissions: $permissions)';
  }

  /// Create a copy of RoleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleModelImplCopyWith<_$RoleModelImpl> get copyWith =>
      __$$RoleModelImplCopyWithImpl<_$RoleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleModelImplToJson(this);
  }
}

abstract class _RoleModel extends RoleModel {
  factory _RoleModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? nameEn,
    String? nameAr,
    String? initialLocation,
    bool analytics,
    List<PermissionModel>? permissions,
  }) = _$RoleModelImpl;
  _RoleModel._() : super._();

  factory _RoleModel.fromJson(Map<String, dynamic> json) =
      _$RoleModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String? get nameEn;
  set nameEn(String? value);
  @override
  String? get nameAr;
  set nameAr(String? value);
  @override
  String? get initialLocation;
  set initialLocation(String? value);
  @override
  bool get analytics;
  set analytics(bool value);
  @override
  List<PermissionModel>? get permissions;
  set permissions(List<PermissionModel>? value);

  /// Create a copy of RoleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleModelImplCopyWith<_$RoleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
