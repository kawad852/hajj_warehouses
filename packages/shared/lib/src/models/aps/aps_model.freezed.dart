// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aps_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApsModel _$ApsModelFromJson(Map<String, dynamic> json) {
  return _ApsModel.fromJson(json);
}

/// @nodoc
mixin _$ApsModel {
  String? get sound => throw _privateConstructorUsedError;
  set sound(String? value) => throw _privateConstructorUsedError;

  /// Serializes this ApsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApsModelCopyWith<ApsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApsModelCopyWith<$Res> {
  factory $ApsModelCopyWith(ApsModel value, $Res Function(ApsModel) then) =
      _$ApsModelCopyWithImpl<$Res, ApsModel>;
  @useResult
  $Res call({String? sound});
}

/// @nodoc
class _$ApsModelCopyWithImpl<$Res, $Val extends ApsModel>
    implements $ApsModelCopyWith<$Res> {
  _$ApsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sound = freezed}) {
    return _then(
      _value.copyWith(
            sound:
                freezed == sound
                    ? _value.sound
                    : sound // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApsModelImplCopyWith<$Res>
    implements $ApsModelCopyWith<$Res> {
  factory _$$ApsModelImplCopyWith(
    _$ApsModelImpl value,
    $Res Function(_$ApsModelImpl) then,
  ) = __$$ApsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? sound});
}

/// @nodoc
class __$$ApsModelImplCopyWithImpl<$Res>
    extends _$ApsModelCopyWithImpl<$Res, _$ApsModelImpl>
    implements _$$ApsModelImplCopyWith<$Res> {
  __$$ApsModelImplCopyWithImpl(
    _$ApsModelImpl _value,
    $Res Function(_$ApsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sound = freezed}) {
    return _then(
      _$ApsModelImpl(
        sound:
            freezed == sound
                ? _value.sound
                : sound // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApsModelImpl implements _ApsModel {
  _$ApsModelImpl({this.sound});

  factory _$ApsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApsModelImplFromJson(json);

  @override
  String? sound;

  @override
  String toString() {
    return 'ApsModel(sound: $sound)';
  }

  /// Create a copy of ApsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApsModelImplCopyWith<_$ApsModelImpl> get copyWith =>
      __$$ApsModelImplCopyWithImpl<_$ApsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApsModelImplToJson(this);
  }
}

abstract class _ApsModel implements ApsModel {
  factory _ApsModel({String? sound}) = _$ApsModelImpl;

  factory _ApsModel.fromJson(Map<String, dynamic> json) =
      _$ApsModelImpl.fromJson;

  @override
  String? get sound;
  set sound(String? value);

  /// Create a copy of ApsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApsModelImplCopyWith<_$ApsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
