// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  set note(String value) => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  set userId(String value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  bool get urgent => throw _privateConstructorUsedError;
  set urgent(bool value) => throw _privateConstructorUsedError;
  List<LightItemModel> get items => throw _privateConstructorUsedError;
  set items(List<LightItemModel> value) => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
    OrderModel value,
    $Res Function(OrderModel) then,
  ) = _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String note,
    String userId,
    String status,
    bool urgent,
    List<LightItemModel> items,
  });
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? note = null,
    Object? userId = null,
    Object? status = null,
    Object? urgent = null,
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
            note:
                null == note
                    ? _value.note
                    : note // ignore: cast_nullable_to_non_nullable
                        as String,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            urgent:
                null == urgent
                    ? _value.urgent
                    : urgent // ignore: cast_nullable_to_non_nullable
                        as bool,
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
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
    _$OrderModelImpl value,
    $Res Function(_$OrderModelImpl) then,
  ) = __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String note,
    String userId,
    String status,
    bool urgent,
    List<LightItemModel> items,
  });
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
    _$OrderModelImpl _value,
    $Res Function(_$OrderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? note = null,
    Object? userId = null,
    Object? status = null,
    Object? urgent = null,
    Object? items = null,
  }) {
    return _then(
      _$OrderModelImpl(
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
        note:
            null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        urgent:
            null == urgent
                ? _value.urgent
                : urgent // ignore: cast_nullable_to_non_nullable
                    as bool,
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

@JsonSerializable(explicitToJson: true)
class _$OrderModelImpl extends _OrderModel {
  _$OrderModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id = '',
    this.note = '',
    this.userId = '',
    required this.status,
    this.urgent = false,
    required this.items,
  }) : super._();

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String note;
  @override
  @JsonKey()
  String userId;
  @override
  String status;
  @override
  @JsonKey()
  bool urgent;
  @override
  List<LightItemModel> items;

  @override
  String toString() {
    return 'OrderModel(createdAt: $createdAt, id: $id, note: $note, userId: $userId, status: $status, urgent: $urgent, items: $items)';
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(this);
  }
}

abstract class _OrderModel extends OrderModel {
  factory _OrderModel({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String note,
    String userId,
    required String status,
    bool urgent,
    required List<LightItemModel> items,
  }) = _$OrderModelImpl;
  _OrderModel._() : super._();

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  String get note;
  set note(String value);
  @override
  String get userId;
  set userId(String value);
  @override
  String get status;
  set status(String value);
  @override
  bool get urgent;
  set urgent(bool value);
  @override
  List<LightItemModel> get items;
  set items(List<LightItemModel> value);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
