// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  @TimestampSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get branchId => throw _privateConstructorUsedError;
  set branchId(String value) => throw _privateConstructorUsedError;
  String get transactionType => throw _privateConstructorUsedError;
  set transactionType(String value) => throw _privateConstructorUsedError;
  String? get addReason => throw _privateConstructorUsedError;
  set addReason(String? value) => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  set notes(String? value) => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  set amount(double value) => throw _privateConstructorUsedError;
  String get operationId => throw _privateConstructorUsedError;
  set operationId(String value) => throw _privateConstructorUsedError;
  LightUserModel get user => throw _privateConstructorUsedError;
  set user(LightUserModel value) => throw _privateConstructorUsedError;

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
    TransactionModel value,
    $Res Function(TransactionModel) then,
  ) = _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime createdAt,
    String id,
    String branchId,
    String transactionType,
    String? addReason,
    String? notes,
    double amount,
    String operationId,
    LightUserModel user,
  });

  $LightUserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? branchId = null,
    Object? transactionType = null,
    Object? addReason = freezed,
    Object? notes = freezed,
    Object? amount = null,
    Object? operationId = null,
    Object? user = null,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
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
            transactionType:
                null == transactionType
                    ? _value.transactionType
                    : transactionType // ignore: cast_nullable_to_non_nullable
                        as String,
            addReason:
                freezed == addReason
                    ? _value.addReason
                    : addReason // ignore: cast_nullable_to_non_nullable
                        as String?,
            notes:
                freezed == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String?,
            amount:
                null == amount
                    ? _value.amount
                    : amount // ignore: cast_nullable_to_non_nullable
                        as double,
            operationId:
                null == operationId
                    ? _value.operationId
                    : operationId // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of TransactionModel
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
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(
    _$TransactionModelImpl value,
    $Res Function(_$TransactionModelImpl) then,
  ) = __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime createdAt,
    String id,
    String branchId,
    String transactionType,
    String? addReason,
    String? notes,
    double amount,
    String operationId,
    LightUserModel user,
  });

  @override
  $LightUserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(
    _$TransactionModelImpl _value,
    $Res Function(_$TransactionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? branchId = null,
    Object? transactionType = null,
    Object? addReason = freezed,
    Object? notes = freezed,
    Object? amount = null,
    Object? operationId = null,
    Object? user = null,
  }) {
    return _then(
      _$TransactionModelImpl(
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
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
        transactionType:
            null == transactionType
                ? _value.transactionType
                : transactionType // ignore: cast_nullable_to_non_nullable
                    as String,
        addReason:
            freezed == addReason
                ? _value.addReason
                : addReason // ignore: cast_nullable_to_non_nullable
                    as String?,
        notes:
            freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String?,
        amount:
            null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                    as double,
        operationId:
            null == operationId
                ? _value.operationId
                : operationId // ignore: cast_nullable_to_non_nullable
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
class _$TransactionModelImpl implements _TransactionModel {
  _$TransactionModelImpl({
    @TimestampSerializer() required this.createdAt,
    required this.id,
    required this.branchId,
    required this.transactionType,
    this.addReason,
    this.notes,
    required this.amount,
    required this.operationId,
    required this.user,
  });

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime createdAt;
  @override
  String id;
  @override
  String branchId;
  @override
  String transactionType;
  @override
  String? addReason;
  @override
  String? notes;
  @override
  double amount;
  @override
  String operationId;
  @override
  LightUserModel user;

  @override
  String toString() {
    return 'TransactionModel(createdAt: $createdAt, id: $id, branchId: $branchId, transactionType: $transactionType, addReason: $addReason, notes: $notes, amount: $amount, operationId: $operationId, user: $user)';
  }

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(this);
  }
}

abstract class _TransactionModel implements TransactionModel {
  factory _TransactionModel({
    @TimestampSerializer() required DateTime createdAt,
    required String id,
    required String branchId,
    required String transactionType,
    String? addReason,
    String? notes,
    required double amount,
    required String operationId,
    required LightUserModel user,
  }) = _$TransactionModelImpl;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime value);
  @override
  String get id;
  set id(String value);
  @override
  String get branchId;
  set branchId(String value);
  @override
  String get transactionType;
  set transactionType(String value);
  @override
  String? get addReason;
  set addReason(String? value);
  @override
  String? get notes;
  set notes(String? value);
  @override
  double get amount;
  set amount(double value);
  @override
  String get operationId;
  set operationId(String value);
  @override
  LightUserModel get user;
  set user(LightUserModel value);

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
