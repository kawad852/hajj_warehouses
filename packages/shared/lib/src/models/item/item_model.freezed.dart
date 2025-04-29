// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return _ItemModel.fromJson(json);
}

/// @nodoc
mixin _$ItemModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  set categoryId(String value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  String get branchId => throw _privateConstructorUsedError;
  set branchId(String value) => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  set quantity(int value) => throw _privateConstructorUsedError;
  int get minimumQuantity => throw _privateConstructorUsedError;
  set minimumQuantity(int value) => throw _privateConstructorUsedError;
  LightUserModel? get user => throw _privateConstructorUsedError;
  set user(LightUserModel? value) => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get suggested => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set suggested(bool value) => throw _privateConstructorUsedError;

  /// Serializes this ItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemModelCopyWith<ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemModelCopyWith<$Res> {
  factory $ItemModelCopyWith(ItemModel value, $Res Function(ItemModel) then) =
      _$ItemModelCopyWithImpl<$Res, ItemModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String name,
    String categoryId,
    String status,
    String branchId,
    int quantity,
    int minimumQuantity,
    LightUserModel? user,
    @JsonKey(includeToJson: false, includeFromJson: false) bool suggested,
  });

  $LightUserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ItemModelCopyWithImpl<$Res, $Val extends ItemModel>
    implements $ItemModelCopyWith<$Res> {
  _$ItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? name = null,
    Object? categoryId = null,
    Object? status = null,
    Object? branchId = null,
    Object? quantity = null,
    Object? minimumQuantity = null,
    Object? user = freezed,
    Object? suggested = null,
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
            categoryId:
                null == categoryId
                    ? _value.categoryId
                    : categoryId // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            branchId:
                null == branchId
                    ? _value.branchId
                    : branchId // ignore: cast_nullable_to_non_nullable
                        as String,
            quantity:
                null == quantity
                    ? _value.quantity
                    : quantity // ignore: cast_nullable_to_non_nullable
                        as int,
            minimumQuantity:
                null == minimumQuantity
                    ? _value.minimumQuantity
                    : minimumQuantity // ignore: cast_nullable_to_non_nullable
                        as int,
            user:
                freezed == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as LightUserModel?,
            suggested:
                null == suggested
                    ? _value.suggested
                    : suggested // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of ItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightUserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $LightUserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemModelImplCopyWith<$Res>
    implements $ItemModelCopyWith<$Res> {
  factory _$$ItemModelImplCopyWith(
    _$ItemModelImpl value,
    $Res Function(_$ItemModelImpl) then,
  ) = __$$ItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String name,
    String categoryId,
    String status,
    String branchId,
    int quantity,
    int minimumQuantity,
    LightUserModel? user,
    @JsonKey(includeToJson: false, includeFromJson: false) bool suggested,
  });

  @override
  $LightUserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ItemModelImplCopyWithImpl<$Res>
    extends _$ItemModelCopyWithImpl<$Res, _$ItemModelImpl>
    implements _$$ItemModelImplCopyWith<$Res> {
  __$$ItemModelImplCopyWithImpl(
    _$ItemModelImpl _value,
    $Res Function(_$ItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? name = null,
    Object? categoryId = null,
    Object? status = null,
    Object? branchId = null,
    Object? quantity = null,
    Object? minimumQuantity = null,
    Object? user = freezed,
    Object? suggested = null,
  }) {
    return _then(
      _$ItemModelImpl(
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
        categoryId:
            null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        branchId:
            null == branchId
                ? _value.branchId
                : branchId // ignore: cast_nullable_to_non_nullable
                    as String,
        quantity:
            null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                    as int,
        minimumQuantity:
            null == minimumQuantity
                ? _value.minimumQuantity
                : minimumQuantity // ignore: cast_nullable_to_non_nullable
                    as int,
        user:
            freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as LightUserModel?,
        suggested:
            null == suggested
                ? _value.suggested
                : suggested // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ItemModelImpl extends _ItemModel {
  _$ItemModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id = '',
    this.name = '',
    this.categoryId = '',
    this.status = '',
    this.branchId = '',
    this.quantity = 0,
    this.minimumQuantity = 0,
    this.user,
    @JsonKey(includeToJson: false, includeFromJson: false)
    this.suggested = false,
  }) : super._();

  factory _$ItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemModelImplFromJson(json);

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
  String categoryId;
  @override
  @JsonKey()
  String status;
  @override
  @JsonKey()
  String branchId;
  @override
  @JsonKey()
  int quantity;
  @override
  @JsonKey()
  int minimumQuantity;
  @override
  LightUserModel? user;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool suggested;

  @override
  String toString() {
    return 'ItemModel(createdAt: $createdAt, id: $id, name: $name, categoryId: $categoryId, status: $status, branchId: $branchId, quantity: $quantity, minimumQuantity: $minimumQuantity, user: $user, suggested: $suggested)';
  }

  /// Create a copy of ItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemModelImplCopyWith<_$ItemModelImpl> get copyWith =>
      __$$ItemModelImplCopyWithImpl<_$ItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemModelImplToJson(this);
  }
}

abstract class _ItemModel extends ItemModel {
  factory _ItemModel({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String name,
    String categoryId,
    String status,
    String branchId,
    int quantity,
    int minimumQuantity,
    LightUserModel? user,
    @JsonKey(includeToJson: false, includeFromJson: false) bool suggested,
  }) = _$ItemModelImpl;
  _ItemModel._() : super._();

  factory _ItemModel.fromJson(Map<String, dynamic> json) =
      _$ItemModelImpl.fromJson;

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
  String get categoryId;
  set categoryId(String value);
  @override
  String get status;
  set status(String value);
  @override
  String get branchId;
  set branchId(String value);
  @override
  int get quantity;
  set quantity(int value);
  @override
  int get minimumQuantity;
  set minimumQuantity(int value);
  @override
  LightUserModel? get user;
  set user(LightUserModel? value);
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get suggested;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set suggested(bool value);

  /// Create a copy of ItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemModelImplCopyWith<_$ItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LightItemModel _$LightItemModelFromJson(Map<String, dynamic> json) {
  return _LightItemModel.fromJson(json);
}

/// @nodoc
mixin _$LightItemModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  set quantity(int value) => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int get minimumQuantity => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  set minimumQuantity(int value) => throw _privateConstructorUsedError;

  /// Serializes this LightItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LightItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LightItemModelCopyWith<LightItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightItemModelCopyWith<$Res> {
  factory $LightItemModelCopyWith(
    LightItemModel value,
    $Res Function(LightItemModel) then,
  ) = _$LightItemModelCopyWithImpl<$Res, LightItemModel>;
  @useResult
  $Res call({
    String id,
    String name,
    int quantity,
    @JsonKey(includeFromJson: false, includeToJson: false) int minimumQuantity,
  });
}

/// @nodoc
class _$LightItemModelCopyWithImpl<$Res, $Val extends LightItemModel>
    implements $LightItemModelCopyWith<$Res> {
  _$LightItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LightItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? minimumQuantity = null,
  }) {
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
            quantity:
                null == quantity
                    ? _value.quantity
                    : quantity // ignore: cast_nullable_to_non_nullable
                        as int,
            minimumQuantity:
                null == minimumQuantity
                    ? _value.minimumQuantity
                    : minimumQuantity // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LightItemModelImplCopyWith<$Res>
    implements $LightItemModelCopyWith<$Res> {
  factory _$$LightItemModelImplCopyWith(
    _$LightItemModelImpl value,
    $Res Function(_$LightItemModelImpl) then,
  ) = __$$LightItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    int quantity,
    @JsonKey(includeFromJson: false, includeToJson: false) int minimumQuantity,
  });
}

/// @nodoc
class __$$LightItemModelImplCopyWithImpl<$Res>
    extends _$LightItemModelCopyWithImpl<$Res, _$LightItemModelImpl>
    implements _$$LightItemModelImplCopyWith<$Res> {
  __$$LightItemModelImplCopyWithImpl(
    _$LightItemModelImpl _value,
    $Res Function(_$LightItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LightItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? minimumQuantity = null,
  }) {
    return _then(
      _$LightItemModelImpl(
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
        quantity:
            null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                    as int,
        minimumQuantity:
            null == minimumQuantity
                ? _value.minimumQuantity
                : minimumQuantity // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LightItemModelImpl implements _LightItemModel {
  _$LightItemModelImpl({
    this.id = '',
    this.name = '',
    this.quantity = 0,
    @JsonKey(includeFromJson: false, includeToJson: false)
    this.minimumQuantity = 0,
  });

  factory _$LightItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightItemModelImplFromJson(json);

  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String name;
  @override
  @JsonKey()
  int quantity;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  int minimumQuantity;

  @override
  String toString() {
    return 'LightItemModel(id: $id, name: $name, quantity: $quantity, minimumQuantity: $minimumQuantity)';
  }

  /// Create a copy of LightItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightItemModelImplCopyWith<_$LightItemModelImpl> get copyWith =>
      __$$LightItemModelImplCopyWithImpl<_$LightItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LightItemModelImplToJson(this);
  }
}

abstract class _LightItemModel implements LightItemModel {
  factory _LightItemModel({
    String id,
    String name,
    int quantity,
    @JsonKey(includeFromJson: false, includeToJson: false) int minimumQuantity,
  }) = _$LightItemModelImpl;

  factory _LightItemModel.fromJson(Map<String, dynamic> json) =
      _$LightItemModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  int get quantity;
  set quantity(int value);
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  int get minimumQuantity;
  @JsonKey(includeFromJson: false, includeToJson: false)
  set minimumQuantity(int value);

  /// Create a copy of LightItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightItemModelImplCopyWith<_$LightItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
