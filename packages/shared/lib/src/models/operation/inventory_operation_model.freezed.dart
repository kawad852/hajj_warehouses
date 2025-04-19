// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_operation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InventoryOperationModel _$InventoryOperationModelFromJson(
  Map<String, dynamic> json,
) {
  return _InventoryOperationModel.fromJson(json);
}

/// @nodoc
mixin _$InventoryOperationModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  set displayName(String value) => throw _privateConstructorUsedError;
  List<LightItemModel> get items => throw _privateConstructorUsedError;
  set items(List<LightItemModel> value) => throw _privateConstructorUsedError;

  /// Serializes this InventoryOperationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryOperationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryOperationModelCopyWith<InventoryOperationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryOperationModelCopyWith<$Res> {
  factory $InventoryOperationModelCopyWith(
    InventoryOperationModel value,
    $Res Function(InventoryOperationModel) then,
  ) = _$InventoryOperationModelCopyWithImpl<$Res, InventoryOperationModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String type,
    String displayName,
    List<LightItemModel> items,
  });
}

/// @nodoc
class _$InventoryOperationModelCopyWithImpl<
  $Res,
  $Val extends InventoryOperationModel
>
    implements $InventoryOperationModelCopyWith<$Res> {
  _$InventoryOperationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryOperationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? type = null,
    Object? displayName = null,
    Object? items = null,
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
            displayName:
                null == displayName
                    ? _value.displayName
                    : displayName // ignore: cast_nullable_to_non_nullable
                        as String,
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<LightItemModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InventoryOperationModelImplCopyWith<$Res>
    implements $InventoryOperationModelCopyWith<$Res> {
  factory _$$InventoryOperationModelImplCopyWith(
    _$InventoryOperationModelImpl value,
    $Res Function(_$InventoryOperationModelImpl) then,
  ) = __$$InventoryOperationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String type,
    String displayName,
    List<LightItemModel> items,
  });
}

/// @nodoc
class __$$InventoryOperationModelImplCopyWithImpl<$Res>
    extends
        _$InventoryOperationModelCopyWithImpl<
          $Res,
          _$InventoryOperationModelImpl
        >
    implements _$$InventoryOperationModelImplCopyWith<$Res> {
  __$$InventoryOperationModelImplCopyWithImpl(
    _$InventoryOperationModelImpl _value,
    $Res Function(_$InventoryOperationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InventoryOperationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? type = null,
    Object? displayName = null,
    Object? items = null,
  }) {
    return _then(
      _$InventoryOperationModelImpl(
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
        displayName:
            null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                    as String,
        items:
            null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<LightItemModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryOperationModelImpl implements _InventoryOperationModel {
  _$InventoryOperationModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id = '',
    this.type = '',
    this.displayName = '',
    this.items = const [],
  });

  factory _$InventoryOperationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryOperationModelImplFromJson(json);

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
  @JsonKey()
  String displayName;
  @override
  @JsonKey()
  List<LightItemModel> items;

  @override
  String toString() {
    return 'InventoryOperationModel(createdAt: $createdAt, id: $id, type: $type, displayName: $displayName, items: $items)';
  }

  /// Create a copy of InventoryOperationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryOperationModelImplCopyWith<_$InventoryOperationModelImpl>
  get copyWith => __$$InventoryOperationModelImplCopyWithImpl<
    _$InventoryOperationModelImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryOperationModelImplToJson(this);
  }
}

abstract class _InventoryOperationModel implements InventoryOperationModel {
  factory _InventoryOperationModel({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String type,
    String displayName,
    List<LightItemModel> items,
  }) = _$InventoryOperationModelImpl;

  factory _InventoryOperationModel.fromJson(Map<String, dynamic> json) =
      _$InventoryOperationModelImpl.fromJson;

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
  String get displayName;
  set displayName(String value);
  @override
  List<LightItemModel> get items;
  set items(List<LightItemModel> value);

  /// Create a copy of InventoryOperationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryOperationModelImplCopyWith<_$InventoryOperationModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
