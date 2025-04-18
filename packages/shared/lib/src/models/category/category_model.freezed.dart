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
  String get thumbnail => throw _privateConstructorUsedError;
  set thumbnail(String value) => throw _privateConstructorUsedError;
  List<String> get parentCategoryIds => throw _privateConstructorUsedError;
  set parentCategoryIds(List<String> value) =>
      throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  set order(int value) => throw _privateConstructorUsedError;
  bool get published => throw _privateConstructorUsedError;
  set published(bool value) => throw _privateConstructorUsedError;
  bool get showOnHome => throw _privateConstructorUsedError;
  set showOnHome(bool value) => throw _privateConstructorUsedError;

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
    String thumbnail,
    List<String> parentCategoryIds,
    int order,
    bool published,
    bool showOnHome,
  });
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
    Object? thumbnail = null,
    Object? parentCategoryIds = null,
    Object? order = null,
    Object? published = null,
    Object? showOnHome = null,
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
            thumbnail:
                null == thumbnail
                    ? _value.thumbnail
                    : thumbnail // ignore: cast_nullable_to_non_nullable
                        as String,
            parentCategoryIds:
                null == parentCategoryIds
                    ? _value.parentCategoryIds
                    : parentCategoryIds // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            order:
                null == order
                    ? _value.order
                    : order // ignore: cast_nullable_to_non_nullable
                        as int,
            published:
                null == published
                    ? _value.published
                    : published // ignore: cast_nullable_to_non_nullable
                        as bool,
            showOnHome:
                null == showOnHome
                    ? _value.showOnHome
                    : showOnHome // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
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
    String thumbnail,
    List<String> parentCategoryIds,
    int order,
    bool published,
    bool showOnHome,
  });
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
    Object? thumbnail = null,
    Object? parentCategoryIds = null,
    Object? order = null,
    Object? published = null,
    Object? showOnHome = null,
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
        thumbnail:
            null == thumbnail
                ? _value.thumbnail
                : thumbnail // ignore: cast_nullable_to_non_nullable
                    as String,
        parentCategoryIds:
            null == parentCategoryIds
                ? _value.parentCategoryIds
                : parentCategoryIds // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        order:
            null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                    as int,
        published:
            null == published
                ? _value.published
                : published // ignore: cast_nullable_to_non_nullable
                    as bool,
        showOnHome:
            null == showOnHome
                ? _value.showOnHome
                : showOnHome // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl extends _CategoryModel {
  _$CategoryModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id = '',
    this.name = '',
    this.thumbnail = '',
    this.parentCategoryIds = const [],
    this.order = kOrder,
    this.published = true,
    this.showOnHome = false,
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
  @JsonKey()
  String thumbnail;
  @override
  @JsonKey()
  List<String> parentCategoryIds;
  @override
  @JsonKey()
  int order;
  @override
  @JsonKey()
  bool published;
  @override
  @JsonKey()
  bool showOnHome;

  @override
  String toString() {
    return 'CategoryModel(createdAt: $createdAt, id: $id, name: $name, thumbnail: $thumbnail, parentCategoryIds: $parentCategoryIds, order: $order, published: $published, showOnHome: $showOnHome)';
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
    String thumbnail,
    List<String> parentCategoryIds,
    int order,
    bool published,
    bool showOnHome,
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
  String get thumbnail;
  set thumbnail(String value);
  @override
  List<String> get parentCategoryIds;
  set parentCategoryIds(List<String> value);
  @override
  int get order;
  set order(int value);
  @override
  bool get published;
  set published(bool value);
  @override
  bool get showOnHome;
  set showOnHome(bool value);

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
