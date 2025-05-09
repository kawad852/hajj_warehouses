// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PermissionModel _$PermissionModelFromJson(Map<String, dynamic> json) {
  return _PermissionModel.fromJson(json);
}

/// @nodoc
mixin _$PermissionModel {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  set path(String? value) => throw _privateConstructorUsedError;
  bool get add => throw _privateConstructorUsedError;
  set add(bool value) => throw _privateConstructorUsedError;
  bool get edit => throw _privateConstructorUsedError;
  set edit(bool value) => throw _privateConstructorUsedError;
  bool get show => throw _privateConstructorUsedError;
  set show(bool value) => throw _privateConstructorUsedError;
  bool get delete => throw _privateConstructorUsedError;
  set delete(bool value) => throw _privateConstructorUsedError;

  /// Serializes this PermissionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionModelCopyWith<PermissionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionModelCopyWith<$Res> {
  factory $PermissionModelCopyWith(
    PermissionModel value,
    $Res Function(PermissionModel) then,
  ) = _$PermissionModelCopyWithImpl<$Res, PermissionModel>;
  @useResult
  $Res call({
    String? id,
    String? path,
    bool add,
    bool edit,
    bool show,
    bool delete,
  });
}

/// @nodoc
class _$PermissionModelCopyWithImpl<$Res, $Val extends PermissionModel>
    implements $PermissionModelCopyWith<$Res> {
  _$PermissionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? path = freezed,
    Object? add = null,
    Object? edit = null,
    Object? show = null,
    Object? delete = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            path:
                freezed == path
                    ? _value.path
                    : path // ignore: cast_nullable_to_non_nullable
                        as String?,
            add:
                null == add
                    ? _value.add
                    : add // ignore: cast_nullable_to_non_nullable
                        as bool,
            edit:
                null == edit
                    ? _value.edit
                    : edit // ignore: cast_nullable_to_non_nullable
                        as bool,
            show:
                null == show
                    ? _value.show
                    : show // ignore: cast_nullable_to_non_nullable
                        as bool,
            delete:
                null == delete
                    ? _value.delete
                    : delete // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PermissionModelImplCopyWith<$Res>
    implements $PermissionModelCopyWith<$Res> {
  factory _$$PermissionModelImplCopyWith(
    _$PermissionModelImpl value,
    $Res Function(_$PermissionModelImpl) then,
  ) = __$$PermissionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? path,
    bool add,
    bool edit,
    bool show,
    bool delete,
  });
}

/// @nodoc
class __$$PermissionModelImplCopyWithImpl<$Res>
    extends _$PermissionModelCopyWithImpl<$Res, _$PermissionModelImpl>
    implements _$$PermissionModelImplCopyWith<$Res> {
  __$$PermissionModelImplCopyWithImpl(
    _$PermissionModelImpl _value,
    $Res Function(_$PermissionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? path = freezed,
    Object? add = null,
    Object? edit = null,
    Object? show = null,
    Object? delete = null,
  }) {
    return _then(
      _$PermissionModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        path:
            freezed == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                    as String?,
        add:
            null == add
                ? _value.add
                : add // ignore: cast_nullable_to_non_nullable
                    as bool,
        edit:
            null == edit
                ? _value.edit
                : edit // ignore: cast_nullable_to_non_nullable
                    as bool,
        show:
            null == show
                ? _value.show
                : show // ignore: cast_nullable_to_non_nullable
                    as bool,
        delete:
            null == delete
                ? _value.delete
                : delete // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionModelImpl implements _PermissionModel {
  _$PermissionModelImpl({
    this.id,
    this.path,
    this.add = false,
    this.edit = false,
    this.show = false,
    this.delete = false,
  });

  factory _$PermissionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionModelImplFromJson(json);

  @override
  String? id;
  @override
  String? path;
  @override
  @JsonKey()
  bool add;
  @override
  @JsonKey()
  bool edit;
  @override
  @JsonKey()
  bool show;
  @override
  @JsonKey()
  bool delete;

  @override
  String toString() {
    return 'PermissionModel(id: $id, path: $path, add: $add, edit: $edit, show: $show, delete: $delete)';
  }

  /// Create a copy of PermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionModelImplCopyWith<_$PermissionModelImpl> get copyWith =>
      __$$PermissionModelImplCopyWithImpl<_$PermissionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionModelImplToJson(this);
  }
}

abstract class _PermissionModel implements PermissionModel {
  factory _PermissionModel({
    String? id,
    String? path,
    bool add,
    bool edit,
    bool show,
    bool delete,
  }) = _$PermissionModelImpl;

  factory _PermissionModel.fromJson(Map<String, dynamic> json) =
      _$PermissionModelImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get path;
  set path(String? value);
  @override
  bool get add;
  set add(bool value);
  @override
  bool get edit;
  set edit(bool value);
  @override
  bool get show;
  set show(bool value);
  @override
  bool get delete;
  set delete(bool value);

  /// Create a copy of PermissionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionModelImplCopyWith<_$PermissionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
