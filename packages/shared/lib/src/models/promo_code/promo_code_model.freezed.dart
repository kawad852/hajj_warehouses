// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PromoCodeModel _$PromoCodeModelFromJson(Map<String, dynamic> json) {
  return _PromoCodeModel.fromJson(json);
}

/// @nodoc
mixin _$PromoCodeModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set expiryDate(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  set code(String? value) => throw _privateConstructorUsedError;
  double? get percent => throw _privateConstructorUsedError;
  set percent(double? value) => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  set amount(double? value) => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  set active(bool value) => throw _privateConstructorUsedError;

  /// Serializes this PromoCodeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromoCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromoCodeModelCopyWith<PromoCodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoCodeModelCopyWith<$Res> {
  factory $PromoCodeModelCopyWith(
    PromoCodeModel value,
    $Res Function(PromoCodeModel) then,
  ) = _$PromoCodeModelCopyWithImpl<$Res, PromoCodeModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? expiryDate,
    String? id,
    String? code,
    double? percent,
    double? amount,
    bool active,
  });
}

/// @nodoc
class _$PromoCodeModelCopyWithImpl<$Res, $Val extends PromoCodeModel>
    implements $PromoCodeModelCopyWith<$Res> {
  _$PromoCodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromoCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? expiryDate = freezed,
    Object? id = freezed,
    Object? code = freezed,
    Object? percent = freezed,
    Object? amount = freezed,
    Object? active = null,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            expiryDate:
                freezed == expiryDate
                    ? _value.expiryDate
                    : expiryDate // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            code:
                freezed == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
                        as String?,
            percent:
                freezed == percent
                    ? _value.percent
                    : percent // ignore: cast_nullable_to_non_nullable
                        as double?,
            amount:
                freezed == amount
                    ? _value.amount
                    : amount // ignore: cast_nullable_to_non_nullable
                        as double?,
            active:
                null == active
                    ? _value.active
                    : active // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PromoCodeModelImplCopyWith<$Res>
    implements $PromoCodeModelCopyWith<$Res> {
  factory _$$PromoCodeModelImplCopyWith(
    _$PromoCodeModelImpl value,
    $Res Function(_$PromoCodeModelImpl) then,
  ) = __$$PromoCodeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? expiryDate,
    String? id,
    String? code,
    double? percent,
    double? amount,
    bool active,
  });
}

/// @nodoc
class __$$PromoCodeModelImplCopyWithImpl<$Res>
    extends _$PromoCodeModelCopyWithImpl<$Res, _$PromoCodeModelImpl>
    implements _$$PromoCodeModelImplCopyWith<$Res> {
  __$$PromoCodeModelImplCopyWithImpl(
    _$PromoCodeModelImpl _value,
    $Res Function(_$PromoCodeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PromoCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? expiryDate = freezed,
    Object? id = freezed,
    Object? code = freezed,
    Object? percent = freezed,
    Object? amount = freezed,
    Object? active = null,
  }) {
    return _then(
      _$PromoCodeModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        expiryDate:
            freezed == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        code:
            freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                    as String?,
        percent:
            freezed == percent
                ? _value.percent
                : percent // ignore: cast_nullable_to_non_nullable
                    as double?,
        amount:
            freezed == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                    as double?,
        active:
            null == active
                ? _value.active
                : active // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PromoCodeModelImpl implements _PromoCodeModel {
  _$PromoCodeModelImpl({
    @TimestampSerializer() this.createdAt,
    @TimestampSerializer() this.expiryDate,
    this.id,
    this.code,
    this.percent,
    this.amount,
    this.active = true,
  });

  factory _$PromoCodeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromoCodeModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @TimestampSerializer()
  DateTime? expiryDate;
  @override
  String? id;
  @override
  String? code;
  @override
  double? percent;
  @override
  double? amount;
  @override
  @JsonKey()
  bool active;

  @override
  String toString() {
    return 'PromoCodeModel(createdAt: $createdAt, expiryDate: $expiryDate, id: $id, code: $code, percent: $percent, amount: $amount, active: $active)';
  }

  /// Create a copy of PromoCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoCodeModelImplCopyWith<_$PromoCodeModelImpl> get copyWith =>
      __$$PromoCodeModelImplCopyWithImpl<_$PromoCodeModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PromoCodeModelImplToJson(this);
  }
}

abstract class _PromoCodeModel implements PromoCodeModel {
  factory _PromoCodeModel({
    @TimestampSerializer() DateTime? createdAt,
    @TimestampSerializer() DateTime? expiryDate,
    String? id,
    String? code,
    double? percent,
    double? amount,
    bool active,
  }) = _$PromoCodeModelImpl;

  factory _PromoCodeModel.fromJson(Map<String, dynamic> json) =
      _$PromoCodeModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  @TimestampSerializer()
  DateTime? get expiryDate;
  @TimestampSerializer()
  set expiryDate(DateTime? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String? get code;
  set code(String? value);
  @override
  double? get percent;
  set percent(double? value);
  @override
  double? get amount;
  set amount(double? value);
  @override
  bool get active;
  set active(bool value);

  /// Create a copy of PromoCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromoCodeModelImplCopyWith<_$PromoCodeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
