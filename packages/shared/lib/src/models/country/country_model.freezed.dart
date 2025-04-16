// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) {
  return _CountryModel.fromJson(json);
}

/// @nodoc
mixin _$CountryModel {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  set code(String? value) => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  set nameEn(String? value) => throw _privateConstructorUsedError;
  String? get nameAr => throw _privateConstructorUsedError;
  set nameAr(String? value) => throw _privateConstructorUsedError;
  String? get dialCode => throw _privateConstructorUsedError;
  set dialCode(String? value) => throw _privateConstructorUsedError;

  /// Serializes this CountryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryModelCopyWith<CountryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryModelCopyWith<$Res> {
  factory $CountryModelCopyWith(
    CountryModel value,
    $Res Function(CountryModel) then,
  ) = _$CountryModelCopyWithImpl<$Res, CountryModel>;
  @useResult
  $Res call({
    String? id,
    @TimestampSerializer() DateTime? createdAt,
    String? code,
    String? nameEn,
    String? nameAr,
    String? dialCode,
  });
}

/// @nodoc
class _$CountryModelCopyWithImpl<$Res, $Val extends CountryModel>
    implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? code = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? dialCode = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            code:
                freezed == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
                        as String?,
            nameEn:
                freezed == nameEn
                    ? _value.nameEn
                    : nameEn // ignore: cast_nullable_to_non_nullable
                        as String?,
            nameAr:
                freezed == nameAr
                    ? _value.nameAr
                    : nameAr // ignore: cast_nullable_to_non_nullable
                        as String?,
            dialCode:
                freezed == dialCode
                    ? _value.dialCode
                    : dialCode // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CountryModelImplCopyWith<$Res>
    implements $CountryModelCopyWith<$Res> {
  factory _$$CountryModelImplCopyWith(
    _$CountryModelImpl value,
    $Res Function(_$CountryModelImpl) then,
  ) = __$$CountryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    @TimestampSerializer() DateTime? createdAt,
    String? code,
    String? nameEn,
    String? nameAr,
    String? dialCode,
  });
}

/// @nodoc
class __$$CountryModelImplCopyWithImpl<$Res>
    extends _$CountryModelCopyWithImpl<$Res, _$CountryModelImpl>
    implements _$$CountryModelImplCopyWith<$Res> {
  __$$CountryModelImplCopyWithImpl(
    _$CountryModelImpl _value,
    $Res Function(_$CountryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? code = freezed,
    Object? nameEn = freezed,
    Object? nameAr = freezed,
    Object? dialCode = freezed,
  }) {
    return _then(
      _$CountryModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        code:
            freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                    as String?,
        nameEn:
            freezed == nameEn
                ? _value.nameEn
                : nameEn // ignore: cast_nullable_to_non_nullable
                    as String?,
        nameAr:
            freezed == nameAr
                ? _value.nameAr
                : nameAr // ignore: cast_nullable_to_non_nullable
                    as String?,
        dialCode:
            freezed == dialCode
                ? _value.dialCode
                : dialCode // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryModelImpl implements _CountryModel {
  _$CountryModelImpl({
    this.id,
    @TimestampSerializer() this.createdAt,
    this.code,
    this.nameEn,
    this.nameAr,
    this.dialCode,
  });

  factory _$CountryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryModelImplFromJson(json);

  @override
  String? id;
  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  String? code;
  @override
  String? nameEn;
  @override
  String? nameAr;
  @override
  String? dialCode;

  @override
  String toString() {
    return 'CountryModel(id: $id, createdAt: $createdAt, code: $code, nameEn: $nameEn, nameAr: $nameAr, dialCode: $dialCode)';
  }

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryModelImplCopyWith<_$CountryModelImpl> get copyWith =>
      __$$CountryModelImplCopyWithImpl<_$CountryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryModelImplToJson(this);
  }
}

abstract class _CountryModel implements CountryModel {
  factory _CountryModel({
    String? id,
    @TimestampSerializer() DateTime? createdAt,
    String? code,
    String? nameEn,
    String? nameAr,
    String? dialCode,
  }) = _$CountryModelImpl;

  factory _CountryModel.fromJson(Map<String, dynamic> json) =
      _$CountryModelImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String? get code;
  set code(String? value);
  @override
  String? get nameEn;
  set nameEn(String? value);
  @override
  String? get nameAr;
  set nameAr(String? value);
  @override
  String? get dialCode;
  set dialCode(String? value);

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryModelImplCopyWith<_$CountryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
