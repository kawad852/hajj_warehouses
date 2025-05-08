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
  LightUserModel get user => throw _privateConstructorUsedError;
  set user(LightUserModel value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  InventoryOperationModel? get operation => throw _privateConstructorUsedError;
  set operation(InventoryOperationModel? value) =>
      throw _privateConstructorUsedError;
  LightBranchModel? get transferFromBranch =>
      throw _privateConstructorUsedError;
  set transferFromBranch(LightBranchModel? value) =>
      throw _privateConstructorUsedError;
  LightBranchModel? get transferToBranch => throw _privateConstructorUsedError;
  set transferToBranch(LightBranchModel? value) =>
      throw _privateConstructorUsedError;
  LightBranchModel get branch => throw _privateConstructorUsedError;
  set branch(LightBranchModel value) => throw _privateConstructorUsedError;

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
    LightUserModel user,
    String status,
    InventoryOperationModel? operation,
    LightBranchModel? transferFromBranch,
    LightBranchModel? transferToBranch,
    LightBranchModel branch,
  });

  $LightUserModelCopyWith<$Res> get user;
  $InventoryOperationModelCopyWith<$Res>? get operation;
  $LightBranchModelCopyWith<$Res>? get transferFromBranch;
  $LightBranchModelCopyWith<$Res>? get transferToBranch;
  $LightBranchModelCopyWith<$Res> get branch;
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
    Object? user = null,
    Object? status = null,
    Object? operation = freezed,
    Object? transferFromBranch = freezed,
    Object? transferToBranch = freezed,
    Object? branch = null,
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
            transferFromBranch:
                freezed == transferFromBranch
                    ? _value.transferFromBranch
                    : transferFromBranch // ignore: cast_nullable_to_non_nullable
                        as LightBranchModel?,
            transferToBranch:
                freezed == transferToBranch
                    ? _value.transferToBranch
                    : transferToBranch // ignore: cast_nullable_to_non_nullable
                        as LightBranchModel?,
            branch:
                null == branch
                    ? _value.branch
                    : branch // ignore: cast_nullable_to_non_nullable
                        as LightBranchModel,
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

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightBranchModelCopyWith<$Res>? get transferFromBranch {
    if (_value.transferFromBranch == null) {
      return null;
    }

    return $LightBranchModelCopyWith<$Res>(_value.transferFromBranch!, (value) {
      return _then(_value.copyWith(transferFromBranch: value) as $Val);
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightBranchModelCopyWith<$Res>? get transferToBranch {
    if (_value.transferToBranch == null) {
      return null;
    }

    return $LightBranchModelCopyWith<$Res>(_value.transferToBranch!, (value) {
      return _then(_value.copyWith(transferToBranch: value) as $Val);
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightBranchModelCopyWith<$Res> get branch {
    return $LightBranchModelCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
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
    LightUserModel user,
    String status,
    InventoryOperationModel? operation,
    LightBranchModel? transferFromBranch,
    LightBranchModel? transferToBranch,
    LightBranchModel branch,
  });

  @override
  $LightUserModelCopyWith<$Res> get user;
  @override
  $InventoryOperationModelCopyWith<$Res>? get operation;
  @override
  $LightBranchModelCopyWith<$Res>? get transferFromBranch;
  @override
  $LightBranchModelCopyWith<$Res>? get transferToBranch;
  @override
  $LightBranchModelCopyWith<$Res> get branch;
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
    Object? user = null,
    Object? status = null,
    Object? operation = freezed,
    Object? transferFromBranch = freezed,
    Object? transferToBranch = freezed,
    Object? branch = null,
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
        transferFromBranch:
            freezed == transferFromBranch
                ? _value.transferFromBranch
                : transferFromBranch // ignore: cast_nullable_to_non_nullable
                    as LightBranchModel?,
        transferToBranch:
            freezed == transferToBranch
                ? _value.transferToBranch
                : transferToBranch // ignore: cast_nullable_to_non_nullable
                    as LightBranchModel?,
        branch:
            null == branch
                ? _value.branch
                : branch // ignore: cast_nullable_to_non_nullable
                    as LightBranchModel,
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
    required this.user,
    required this.status,
    this.operation,
    this.transferFromBranch,
    this.transferToBranch,
    required this.branch,
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
  LightUserModel user;
  @override
  String status;
  @override
  InventoryOperationModel? operation;
  @override
  LightBranchModel? transferFromBranch;
  @override
  LightBranchModel? transferToBranch;
  @override
  LightBranchModel branch;

  @override
  String toString() {
    return 'OrderModel(createdAt: $createdAt, id: $id, user: $user, status: $status, operation: $operation, transferFromBranch: $transferFromBranch, transferToBranch: $transferToBranch, branch: $branch)';
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
    required LightUserModel user,
    required String status,
    InventoryOperationModel? operation,
    LightBranchModel? transferFromBranch,
    LightBranchModel? transferToBranch,
    required LightBranchModel branch,
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
  LightUserModel get user;
  set user(LightUserModel value);
  @override
  String get status;
  set status(String value);
  @override
  InventoryOperationModel? get operation;
  set operation(InventoryOperationModel? value);
  @override
  LightBranchModel? get transferFromBranch;
  set transferFromBranch(LightBranchModel? value);
  @override
  LightBranchModel? get transferToBranch;
  set transferToBranch(LightBranchModel? value);
  @override
  LightBranchModel get branch;
  set branch(LightBranchModel value);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderHistoryModel _$OrderHistoryModelFromJson(Map<String, dynamic> json) {
  return _OrderHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryModel {
  @TimestampSerializer()
  DateTime? get time => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set time(DateTime? value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  LightUserModel get user => throw _privateConstructorUsedError;
  set user(LightUserModel value) => throw _privateConstructorUsedError;
  LightBranchModel get branch => throw _privateConstructorUsedError;
  set branch(LightBranchModel value) => throw _privateConstructorUsedError;
  String get operationType => throw _privateConstructorUsedError;
  set operationType(String value) => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  set images(List<String> value) => throw _privateConstructorUsedError;

  /// Serializes this OrderHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderHistoryModelCopyWith<OrderHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryModelCopyWith<$Res> {
  factory $OrderHistoryModelCopyWith(
    OrderHistoryModel value,
    $Res Function(OrderHistoryModel) then,
  ) = _$OrderHistoryModelCopyWithImpl<$Res, OrderHistoryModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? time,
    String status,
    LightUserModel user,
    LightBranchModel branch,
    String operationType,
    List<String> images,
  });

  $LightUserModelCopyWith<$Res> get user;
  $LightBranchModelCopyWith<$Res> get branch;
}

/// @nodoc
class _$OrderHistoryModelCopyWithImpl<$Res, $Val extends OrderHistoryModel>
    implements $OrderHistoryModelCopyWith<$Res> {
  _$OrderHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? status = null,
    Object? user = null,
    Object? branch = null,
    Object? operationType = null,
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
            branch:
                null == branch
                    ? _value.branch
                    : branch // ignore: cast_nullable_to_non_nullable
                        as LightBranchModel,
            operationType:
                null == operationType
                    ? _value.operationType
                    : operationType // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of OrderHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightUserModelCopyWith<$Res> get user {
    return $LightUserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of OrderHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightBranchModelCopyWith<$Res> get branch {
    return $LightBranchModelCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderHistoryModelImplCopyWith<$Res>
    implements $OrderHistoryModelCopyWith<$Res> {
  factory _$$OrderHistoryModelImplCopyWith(
    _$OrderHistoryModelImpl value,
    $Res Function(_$OrderHistoryModelImpl) then,
  ) = __$$OrderHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? time,
    String status,
    LightUserModel user,
    LightBranchModel branch,
    String operationType,
    List<String> images,
  });

  @override
  $LightUserModelCopyWith<$Res> get user;
  @override
  $LightBranchModelCopyWith<$Res> get branch;
}

/// @nodoc
class __$$OrderHistoryModelImplCopyWithImpl<$Res>
    extends _$OrderHistoryModelCopyWithImpl<$Res, _$OrderHistoryModelImpl>
    implements _$$OrderHistoryModelImplCopyWith<$Res> {
  __$$OrderHistoryModelImplCopyWithImpl(
    _$OrderHistoryModelImpl _value,
    $Res Function(_$OrderHistoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? status = null,
    Object? user = null,
    Object? branch = null,
    Object? operationType = null,
    Object? images = null,
  }) {
    return _then(
      _$OrderHistoryModelImpl(
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
        branch:
            null == branch
                ? _value.branch
                : branch // ignore: cast_nullable_to_non_nullable
                    as LightBranchModel,
        operationType:
            null == operationType
                ? _value.operationType
                : operationType // ignore: cast_nullable_to_non_nullable
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
class _$OrderHistoryModelImpl implements _OrderHistoryModel {
  _$OrderHistoryModelImpl({
    @TimestampSerializer() this.time,
    required this.status,
    required this.user,
    required this.branch,
    required this.operationType,
    this.images = const [],
  });

  factory _$OrderHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? time;
  @override
  String status;
  @override
  LightUserModel user;
  @override
  LightBranchModel branch;
  @override
  String operationType;
  @override
  @JsonKey()
  List<String> images;

  @override
  String toString() {
    return 'OrderHistoryModel(time: $time, status: $status, user: $user, branch: $branch, operationType: $operationType, images: $images)';
  }

  /// Create a copy of OrderHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryModelImplCopyWith<_$OrderHistoryModelImpl> get copyWith =>
      __$$OrderHistoryModelImplCopyWithImpl<_$OrderHistoryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryModelImplToJson(this);
  }
}

abstract class _OrderHistoryModel implements OrderHistoryModel {
  factory _OrderHistoryModel({
    @TimestampSerializer() DateTime? time,
    required String status,
    required LightUserModel user,
    required LightBranchModel branch,
    required String operationType,
    List<String> images,
  }) = _$OrderHistoryModelImpl;

  factory _OrderHistoryModel.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryModelImpl.fromJson;

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
  LightBranchModel get branch;
  set branch(LightBranchModel value);
  @override
  String get operationType;
  set operationType(String value);
  @override
  List<String> get images;
  set images(List<String> value);

  /// Create a copy of OrderHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderHistoryModelImplCopyWith<_$OrderHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
