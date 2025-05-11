// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PayloadModel _$PayloadModelFromJson(Map<String, dynamic> json) {
  return _PayloadModel.fromJson(json);
}

/// @nodoc
mixin _$PayloadModel {
  ApsModel? get aps => throw _privateConstructorUsedError;
  set aps(ApsModel? value) => throw _privateConstructorUsedError;

  /// Serializes this PayloadModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PayloadModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PayloadModelCopyWith<PayloadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayloadModelCopyWith<$Res> {
  factory $PayloadModelCopyWith(
    PayloadModel value,
    $Res Function(PayloadModel) then,
  ) = _$PayloadModelCopyWithImpl<$Res, PayloadModel>;
  @useResult
  $Res call({ApsModel? aps});

  $ApsModelCopyWith<$Res>? get aps;
}

/// @nodoc
class _$PayloadModelCopyWithImpl<$Res, $Val extends PayloadModel>
    implements $PayloadModelCopyWith<$Res> {
  _$PayloadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PayloadModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? aps = freezed}) {
    return _then(
      _value.copyWith(
            aps:
                freezed == aps
                    ? _value.aps
                    : aps // ignore: cast_nullable_to_non_nullable
                        as ApsModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of PayloadModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApsModelCopyWith<$Res>? get aps {
    if (_value.aps == null) {
      return null;
    }

    return $ApsModelCopyWith<$Res>(_value.aps!, (value) {
      return _then(_value.copyWith(aps: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PayloadModelImplCopyWith<$Res>
    implements $PayloadModelCopyWith<$Res> {
  factory _$$PayloadModelImplCopyWith(
    _$PayloadModelImpl value,
    $Res Function(_$PayloadModelImpl) then,
  ) = __$$PayloadModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApsModel? aps});

  @override
  $ApsModelCopyWith<$Res>? get aps;
}

/// @nodoc
class __$$PayloadModelImplCopyWithImpl<$Res>
    extends _$PayloadModelCopyWithImpl<$Res, _$PayloadModelImpl>
    implements _$$PayloadModelImplCopyWith<$Res> {
  __$$PayloadModelImplCopyWithImpl(
    _$PayloadModelImpl _value,
    $Res Function(_$PayloadModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PayloadModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? aps = freezed}) {
    return _then(
      _$PayloadModelImpl(
        aps:
            freezed == aps
                ? _value.aps
                : aps // ignore: cast_nullable_to_non_nullable
                    as ApsModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PayloadModelImpl implements _PayloadModel {
  _$PayloadModelImpl({this.aps});

  factory _$PayloadModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayloadModelImplFromJson(json);

  @override
  ApsModel? aps;

  @override
  String toString() {
    return 'PayloadModel(aps: $aps)';
  }

  /// Create a copy of PayloadModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PayloadModelImplCopyWith<_$PayloadModelImpl> get copyWith =>
      __$$PayloadModelImplCopyWithImpl<_$PayloadModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayloadModelImplToJson(this);
  }
}

abstract class _PayloadModel implements PayloadModel {
  factory _PayloadModel({ApsModel? aps}) = _$PayloadModelImpl;

  factory _PayloadModel.fromJson(Map<String, dynamic> json) =
      _$PayloadModelImpl.fromJson;

  @override
  ApsModel? get aps;
  set aps(ApsModel? value);

  /// Create a copy of PayloadModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PayloadModelImplCopyWith<_$PayloadModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
