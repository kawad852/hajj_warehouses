// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get branchId => throw _privateConstructorUsedError;
  set branchId(String value) => throw _privateConstructorUsedError;
  LightUserModel get user => throw _privateConstructorUsedError;
  set user(LightUserModel value) => throw _privateConstructorUsedError;

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
    CategoryModel value,
    $Res Function(CategoryModel) then,
  ) = _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String name,
    String branchId,
    LightUserModel user,
  });

  $LightUserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? name = null,
    Object? branchId = null,
    Object? user = null,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            branchId:
                null == branchId
                    ? _value.branchId
                    : branchId // ignore: cast_nullable_to_non_nullable
                        as String,
            user:
                null == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as LightUserModel,
          )
          as $Val,
    );
  }

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightUserModelCopyWith<$Res> get user {
    return $LightUserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
    _$CategoryModelImpl value,
    $Res Function(_$CategoryModelImpl) then,
  ) = __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String name,
    String branchId,
    LightUserModel user,
  });

  @override
  $LightUserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
    _$CategoryModelImpl _value,
    $Res Function(_$CategoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? name = null,
    Object? branchId = null,
    Object? user = null,
  }) {
    return _then(
      _$CategoryModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        branchId:
            null == branchId
                ? _value.branchId
                : branchId // ignore: cast_nullable_to_non_nullable
                    as String,
        user:
            null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as LightUserModel,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CategoryModelImpl extends _CategoryModel {
  _$CategoryModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id = '',
    this.name = '',
    required this.branchId,
    required this.user,
  }) : super._();

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String name;
  @override
  String branchId;
  @override
  LightUserModel user;

  @override
  String toString() {
    return 'CategoryModel(createdAt: $createdAt, id: $id, name: $name, branchId: $branchId, user: $user)';
  }

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(this);
  }
}

abstract class _CategoryModel extends CategoryModel {
  factory _CategoryModel({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String name,
    required String branchId,
    required LightUserModel user,
  }) = _$CategoryModelImpl;
  _CategoryModel._() : super._();

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  String get branchId;
  set branchId(String value);
  @override
  LightUserModel get user;
  set user(LightUserModel value);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LightCategoryModel _$LightCategoryModelFromJson(Map<String, dynamic> json) {
  return _LightCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$LightCategoryModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;

  /// Serializes this LightCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LightCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LightCategoryModelCopyWith<LightCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightCategoryModelCopyWith<$Res> {
  factory $LightCategoryModelCopyWith(
    LightCategoryModel value,
    $Res Function(LightCategoryModel) then,
  ) = _$LightCategoryModelCopyWithImpl<$Res, LightCategoryModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$LightCategoryModelCopyWithImpl<$Res, $Val extends LightCategoryModel>
    implements $LightCategoryModelCopyWith<$Res> {
  _$LightCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LightCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LightCategoryModelImplCopyWith<$Res>
    implements $LightCategoryModelCopyWith<$Res> {
  factory _$$LightCategoryModelImplCopyWith(
    _$LightCategoryModelImpl value,
    $Res Function(_$LightCategoryModelImpl) then,
  ) = __$$LightCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$LightCategoryModelImplCopyWithImpl<$Res>
    extends _$LightCategoryModelCopyWithImpl<$Res, _$LightCategoryModelImpl>
    implements _$$LightCategoryModelImplCopyWith<$Res> {
  __$$LightCategoryModelImplCopyWithImpl(
    _$LightCategoryModelImpl _value,
    $Res Function(_$LightCategoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LightCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$LightCategoryModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LightCategoryModelImpl implements _LightCategoryModel {
  _$LightCategoryModelImpl({this.id = '', this.name = ''});

  factory _$LightCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightCategoryModelImplFromJson(json);

  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String name;

  @override
  String toString() {
    return 'LightCategoryModel(id: $id, name: $name)';
  }

  /// Create a copy of LightCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightCategoryModelImplCopyWith<_$LightCategoryModelImpl> get copyWith =>
      __$$LightCategoryModelImplCopyWithImpl<_$LightCategoryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LightCategoryModelImplToJson(this);
  }
}

abstract class _LightCategoryModel implements LightCategoryModel {
  factory _LightCategoryModel({String id, String name}) =
      _$LightCategoryModelImpl;

  factory _LightCategoryModel.fromJson(Map<String, dynamic> json) =
      _$LightCategoryModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);

  /// Create a copy of LightCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightCategoryModelImplCopyWith<_$LightCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
