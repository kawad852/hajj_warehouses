// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) {
  return _BranchModel.fromJson(json);
}

/// @nodoc
mixin _$BranchModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  set balance(double value) => throw _privateConstructorUsedError;

  /// Serializes this BranchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BranchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchModelCopyWith<BranchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchModelCopyWith<$Res> {
  factory $BranchModelCopyWith(
    BranchModel value,
    $Res Function(BranchModel) then,
  ) = _$BranchModelCopyWithImpl<$Res, BranchModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String name,
    double balance,
  });
}

/// @nodoc
class _$BranchModelCopyWithImpl<$Res, $Val extends BranchModel>
    implements $BranchModelCopyWith<$Res> {
  _$BranchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BranchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? name = null,
    Object? balance = null,
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
            balance:
                null == balance
                    ? _value.balance
                    : balance // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BranchModelImplCopyWith<$Res>
    implements $BranchModelCopyWith<$Res> {
  factory _$$BranchModelImplCopyWith(
    _$BranchModelImpl value,
    $Res Function(_$BranchModelImpl) then,
  ) = __$$BranchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String name,
    double balance,
  });
}

/// @nodoc
class __$$BranchModelImplCopyWithImpl<$Res>
    extends _$BranchModelCopyWithImpl<$Res, _$BranchModelImpl>
    implements _$$BranchModelImplCopyWith<$Res> {
  __$$BranchModelImplCopyWithImpl(
    _$BranchModelImpl _value,
    $Res Function(_$BranchModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BranchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? name = null,
    Object? balance = null,
  }) {
    return _then(
      _$BranchModelImpl(
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
        balance:
            null == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BranchModelImpl implements _BranchModel {
  _$BranchModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id = '',
    this.name = '',
    this.balance = 0.0,
  });

  factory _$BranchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchModelImplFromJson(json);

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
  double balance;

  @override
  String toString() {
    return 'BranchModel(createdAt: $createdAt, id: $id, name: $name, balance: $balance)';
  }

  /// Create a copy of BranchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchModelImplCopyWith<_$BranchModelImpl> get copyWith =>
      __$$BranchModelImplCopyWithImpl<_$BranchModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchModelImplToJson(this);
  }
}

abstract class _BranchModel implements BranchModel {
  factory _BranchModel({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String name,
    double balance,
  }) = _$BranchModelImpl;

  factory _BranchModel.fromJson(Map<String, dynamic> json) =
      _$BranchModelImpl.fromJson;

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
  double get balance;
  set balance(double value);

  /// Create a copy of BranchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchModelImplCopyWith<_$BranchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LightBranchModel _$LightBranchModelFromJson(Map<String, dynamic> json) {
  return _LightBranchModel.fromJson(json);
}

/// @nodoc
mixin _$LightBranchModel {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;

  /// Serializes this LightBranchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LightBranchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LightBranchModelCopyWith<LightBranchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightBranchModelCopyWith<$Res> {
  factory $LightBranchModelCopyWith(
    LightBranchModel value,
    $Res Function(LightBranchModel) then,
  ) = _$LightBranchModelCopyWithImpl<$Res, LightBranchModel>;
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class _$LightBranchModelCopyWithImpl<$Res, $Val extends LightBranchModel>
    implements $LightBranchModelCopyWith<$Res> {
  _$LightBranchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LightBranchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = null}) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
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
abstract class _$$LightBranchModelImplCopyWith<$Res>
    implements $LightBranchModelCopyWith<$Res> {
  factory _$$LightBranchModelImplCopyWith(
    _$LightBranchModelImpl value,
    $Res Function(_$LightBranchModelImpl) then,
  ) = __$$LightBranchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class __$$LightBranchModelImplCopyWithImpl<$Res>
    extends _$LightBranchModelCopyWithImpl<$Res, _$LightBranchModelImpl>
    implements _$$LightBranchModelImplCopyWith<$Res> {
  __$$LightBranchModelImplCopyWithImpl(
    _$LightBranchModelImpl _value,
    $Res Function(_$LightBranchModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LightBranchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = null}) {
    return _then(
      _$LightBranchModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
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

@JsonSerializable(explicitToJson: true)
class _$LightBranchModelImpl implements _LightBranchModel {
  _$LightBranchModelImpl({this.id, this.name = ''});

  factory _$LightBranchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightBranchModelImplFromJson(json);

  @override
  String? id;
  @override
  @JsonKey()
  String name;

  @override
  String toString() {
    return 'LightBranchModel(id: $id, name: $name)';
  }

  /// Create a copy of LightBranchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightBranchModelImplCopyWith<_$LightBranchModelImpl> get copyWith =>
      __$$LightBranchModelImplCopyWithImpl<_$LightBranchModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LightBranchModelImplToJson(this);
  }
}

abstract class _LightBranchModel implements LightBranchModel {
  factory _LightBranchModel({String? id, String name}) = _$LightBranchModelImpl;

  factory _LightBranchModel.fromJson(Map<String, dynamic> json) =
      _$LightBranchModelImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String get name;
  set name(String value);

  /// Create a copy of LightBranchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightBranchModelImplCopyWith<_$LightBranchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
