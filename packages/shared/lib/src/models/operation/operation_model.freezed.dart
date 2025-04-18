// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OperationModel _$OperationModelFromJson(Map<String, dynamic> json) {
  return _OperationModel.fromJson(json);
}

/// @nodoc
mixin _$OperationModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;
  LightCategoryModel? get category => throw _privateConstructorUsedError;
  set category(LightCategoryModel? value) => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  set orderId(String? value) => throw _privateConstructorUsedError;
  String? get itemId => throw _privateConstructorUsedError;
  set itemId(String? value) => throw _privateConstructorUsedError;
  String? get transferId => throw _privateConstructorUsedError;
  set transferId(String? value) => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  set displayName(String value) => throw _privateConstructorUsedError;

  /// Serializes this OperationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperationModelCopyWith<OperationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationModelCopyWith<$Res> {
  factory $OperationModelCopyWith(
    OperationModel value,
    $Res Function(OperationModel) then,
  ) = _$OperationModelCopyWithImpl<$Res, OperationModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String type,
    LightCategoryModel? category,
    String? orderId,
    String? itemId,
    String? transferId,
    String displayName,
  });

  $LightCategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class _$OperationModelCopyWithImpl<$Res, $Val extends OperationModel>
    implements $OperationModelCopyWith<$Res> {
  _$OperationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? type = null,
    Object? category = freezed,
    Object? orderId = freezed,
    Object? itemId = freezed,
    Object? transferId = freezed,
    Object? displayName = null,
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
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
            category:
                freezed == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as LightCategoryModel?,
            orderId:
                freezed == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as String?,
            itemId:
                freezed == itemId
                    ? _value.itemId
                    : itemId // ignore: cast_nullable_to_non_nullable
                        as String?,
            transferId:
                freezed == transferId
                    ? _value.transferId
                    : transferId // ignore: cast_nullable_to_non_nullable
                        as String?,
            displayName:
                null == displayName
                    ? _value.displayName
                    : displayName // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightCategoryModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $LightCategoryModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OperationModelImplCopyWith<$Res>
    implements $OperationModelCopyWith<$Res> {
  factory _$$OperationModelImplCopyWith(
    _$OperationModelImpl value,
    $Res Function(_$OperationModelImpl) then,
  ) = __$$OperationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String type,
    LightCategoryModel? category,
    String? orderId,
    String? itemId,
    String? transferId,
    String displayName,
  });

  @override
  $LightCategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class __$$OperationModelImplCopyWithImpl<$Res>
    extends _$OperationModelCopyWithImpl<$Res, _$OperationModelImpl>
    implements _$$OperationModelImplCopyWith<$Res> {
  __$$OperationModelImplCopyWithImpl(
    _$OperationModelImpl _value,
    $Res Function(_$OperationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? type = null,
    Object? category = freezed,
    Object? orderId = freezed,
    Object? itemId = freezed,
    Object? transferId = freezed,
    Object? displayName = null,
  }) {
    return _then(
      _$OperationModelImpl(
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
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        category:
            freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as LightCategoryModel?,
        orderId:
            freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String?,
        itemId:
            freezed == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
                    as String?,
        transferId:
            freezed == transferId
                ? _value.transferId
                : transferId // ignore: cast_nullable_to_non_nullable
                    as String?,
        displayName:
            null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OperationModelImpl implements _OperationModel {
  _$OperationModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id = '',
    this.type = '',
    this.category,
    this.orderId,
    this.itemId,
    this.transferId,
    this.displayName = '',
  });

  factory _$OperationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String type;
  @override
  LightCategoryModel? category;
  @override
  String? orderId;
  @override
  String? itemId;
  @override
  String? transferId;
  @override
  @JsonKey()
  String displayName;

  @override
  String toString() {
    return 'OperationModel(createdAt: $createdAt, id: $id, type: $type, category: $category, orderId: $orderId, itemId: $itemId, transferId: $transferId, displayName: $displayName)';
  }

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationModelImplCopyWith<_$OperationModelImpl> get copyWith =>
      __$$OperationModelImplCopyWithImpl<_$OperationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OperationModelImplToJson(this);
  }
}

abstract class _OperationModel implements OperationModel {
  factory _OperationModel({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String type,
    LightCategoryModel? category,
    String? orderId,
    String? itemId,
    String? transferId,
    String displayName,
  }) = _$OperationModelImpl;

  factory _OperationModel.fromJson(Map<String, dynamic> json) =
      _$OperationModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  String get type;
  set type(String value);
  @override
  LightCategoryModel? get category;
  set category(LightCategoryModel? value);
  @override
  String? get orderId;
  set orderId(String? value);
  @override
  String? get itemId;
  set itemId(String? value);
  @override
  String? get transferId;
  set transferId(String? value);
  @override
  String get displayName;
  set displayName(String value);

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperationModelImplCopyWith<_$OperationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
