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
  String get branchId => throw _privateConstructorUsedError;
  set branchId(String value) => throw _privateConstructorUsedError;
  LightUserModel get user => throw _privateConstructorUsedError;
  set user(LightUserModel value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  InventoryOperationModel? get operation => throw _privateConstructorUsedError;
  set operation(InventoryOperationModel? value) =>
      throw _privateConstructorUsedError;
  List<OrderRecordModel> get orderRecords => throw _privateConstructorUsedError;
  set orderRecords(List<OrderRecordModel> value) =>
      throw _privateConstructorUsedError;

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
    String branchId,
    LightUserModel user,
    String status,
    InventoryOperationModel? operation,
    List<OrderRecordModel> orderRecords,
  });

  $LightUserModelCopyWith<$Res> get user;
  $InventoryOperationModelCopyWith<$Res>? get operation;
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
    Object? branchId = null,
    Object? user = null,
    Object? status = null,
    Object? operation = freezed,
    Object? orderRecords = null,
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
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            operation:
                freezed == operation
                    ? _value.operation
                    : operation // ignore: cast_nullable_to_non_nullable
                        as InventoryOperationModel?,
            orderRecords:
                null == orderRecords
                    ? _value.orderRecords
                    : orderRecords // ignore: cast_nullable_to_non_nullable
                        as List<OrderRecordModel>,
          )
          as $Val,
    );
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightUserModelCopyWith<$Res> get user {
    return $LightUserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InventoryOperationModelCopyWith<$Res>? get operation {
    if (_value.operation == null) {
      return null;
    }

    return $InventoryOperationModelCopyWith<$Res>(_value.operation!, (value) {
      return _then(_value.copyWith(operation: value) as $Val);
    });
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
    String branchId,
    LightUserModel user,
    String status,
    InventoryOperationModel? operation,
    List<OrderRecordModel> orderRecords,
  });

  @override
  $LightUserModelCopyWith<$Res> get user;
  @override
  $InventoryOperationModelCopyWith<$Res>? get operation;
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
    Object? branchId = null,
    Object? user = null,
    Object? status = null,
    Object? operation = freezed,
    Object? orderRecords = null,
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
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        operation:
            freezed == operation
                ? _value.operation
                : operation // ignore: cast_nullable_to_non_nullable
                    as InventoryOperationModel?,
        orderRecords:
            null == orderRecords
                ? _value.orderRecords
                : orderRecords // ignore: cast_nullable_to_non_nullable
                    as List<OrderRecordModel>,
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
    required this.branchId,
    required this.user,
    required this.status,
    this.operation,
    this.orderRecords = const [],
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
  String branchId;
  @override
  LightUserModel user;
  @override
  String status;
  @override
  InventoryOperationModel? operation;
  @override
  @JsonKey()
  List<OrderRecordModel> orderRecords;

  @override
  String toString() {
    return 'OrderModel(createdAt: $createdAt, id: $id, branchId: $branchId, user: $user, status: $status, operation: $operation, orderRecords: $orderRecords)';
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
    required String branchId,
    required LightUserModel user,
    required String status,
    InventoryOperationModel? operation,
    List<OrderRecordModel> orderRecords,
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
  String get branchId;
  set branchId(String value);
  @override
  LightUserModel get user;
  set user(LightUserModel value);
  @override
  String get status;
  set status(String value);
  @override
  InventoryOperationModel? get operation;
  set operation(InventoryOperationModel? value);
  @override
  List<OrderRecordModel> get orderRecords;
  set orderRecords(List<OrderRecordModel> value);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderRecordModel _$OrderRecordModelFromJson(Map<String, dynamic> json) {
  return _OrderRecordModel.fromJson(json);
}

/// @nodoc
mixin _$OrderRecordModel {
  @TimestampSerializer()
  DateTime? get time => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set time(DateTime? value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  LightUserModel get user => throw _privateConstructorUsedError;
  set user(LightUserModel value) => throw _privateConstructorUsedError;
  String get branchId => throw _privateConstructorUsedError;
  set branchId(String value) => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  set images(List<String> value) => throw _privateConstructorUsedError;

  /// Serializes this OrderRecordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderRecordModelCopyWith<OrderRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderRecordModelCopyWith<$Res> {
  factory $OrderRecordModelCopyWith(
    OrderRecordModel value,
    $Res Function(OrderRecordModel) then,
  ) = _$OrderRecordModelCopyWithImpl<$Res, OrderRecordModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? time,
    String status,
    LightUserModel user,
    String branchId,
    List<String> images,
  });

  $LightUserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$OrderRecordModelCopyWithImpl<$Res, $Val extends OrderRecordModel>
    implements $OrderRecordModelCopyWith<$Res> {
  _$OrderRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? status = null,
    Object? user = null,
    Object? branchId = null,
    Object? images = null,
  }) {
    return _then(
      _value.copyWith(
            time:
                freezed == time
                    ? _value.time
                    : time // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            user:
                null == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as LightUserModel,
            branchId:
                null == branchId
                    ? _value.branchId
                    : branchId // ignore: cast_nullable_to_non_nullable
                        as String,
            images:
                null == images
                    ? _value.images
                    : images // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of OrderRecordModel
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
abstract class _$$OrderRecordModelImplCopyWith<$Res>
    implements $OrderRecordModelCopyWith<$Res> {
  factory _$$OrderRecordModelImplCopyWith(
    _$OrderRecordModelImpl value,
    $Res Function(_$OrderRecordModelImpl) then,
  ) = __$$OrderRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? time,
    String status,
    LightUserModel user,
    String branchId,
    List<String> images,
  });

  @override
  $LightUserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$OrderRecordModelImplCopyWithImpl<$Res>
    extends _$OrderRecordModelCopyWithImpl<$Res, _$OrderRecordModelImpl>
    implements _$$OrderRecordModelImplCopyWith<$Res> {
  __$$OrderRecordModelImplCopyWithImpl(
    _$OrderRecordModelImpl _value,
    $Res Function(_$OrderRecordModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? status = null,
    Object? user = null,
    Object? branchId = null,
    Object? images = null,
  }) {
    return _then(
      _$OrderRecordModelImpl(
        time:
            freezed == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        user:
            null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as LightUserModel,
        branchId:
            null == branchId
                ? _value.branchId
                : branchId // ignore: cast_nullable_to_non_nullable
                    as String,
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
class _$OrderRecordModelImpl implements _OrderRecordModel {
  _$OrderRecordModelImpl({
    @TimestampSerializer() this.time,
    required this.status,
    required this.user,
    required this.branchId,
    this.images = const [],
  });

  factory _$OrderRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderRecordModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? time;
  @override
  String status;
  @override
  LightUserModel user;
  @override
  String branchId;
  @override
  @JsonKey()
  List<String> images;

  @override
  String toString() {
    return 'OrderRecordModel(time: $time, status: $status, user: $user, branchId: $branchId, images: $images)';
  }

  /// Create a copy of OrderRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderRecordModelImplCopyWith<_$OrderRecordModelImpl> get copyWith =>
      __$$OrderRecordModelImplCopyWithImpl<_$OrderRecordModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderRecordModelImplToJson(this);
  }
}

abstract class _OrderRecordModel implements OrderRecordModel {
  factory _OrderRecordModel({
    @TimestampSerializer() DateTime? time,
    required String status,
    required LightUserModel user,
    required String branchId,
    List<String> images,
  }) = _$OrderRecordModelImpl;

  factory _OrderRecordModel.fromJson(Map<String, dynamic> json) =
      _$OrderRecordModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get time;
  @TimestampSerializer()
  set time(DateTime? value);
  @override
  String get status;
  set status(String value);
  @override
  LightUserModel get user;
  set user(LightUserModel value);
  @override
  String get branchId;
  set branchId(String value);
  @override
  List<String> get images;
  set images(List<String> value);

  /// Create a copy of OrderRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderRecordModelImplCopyWith<_$OrderRecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
