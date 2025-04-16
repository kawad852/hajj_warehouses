// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'policy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PolicyModel _$PolicyModelFromJson(Map<String, dynamic> json) {
  return _PolicyModel.fromJson(json);
}

/// @nodoc
mixin _$PolicyModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get contentEn => throw _privateConstructorUsedError;
  set contentEn(String value) => throw _privateConstructorUsedError;
  String get contentAr => throw _privateConstructorUsedError;
  set contentAr(String value) => throw _privateConstructorUsedError;
  String get titleEn => throw _privateConstructorUsedError;
  set titleEn(String value) => throw _privateConstructorUsedError;
  String get titleAr => throw _privateConstructorUsedError;
  set titleAr(String value) => throw _privateConstructorUsedError;

  /// Serializes this PolicyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PolicyModelCopyWith<PolicyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PolicyModelCopyWith<$Res> {
  factory $PolicyModelCopyWith(
    PolicyModel value,
    $Res Function(PolicyModel) then,
  ) = _$PolicyModelCopyWithImpl<$Res, PolicyModel>;
  @useResult
  $Res call({
    String id,
    String contentEn,
    String contentAr,
    String titleEn,
    String titleAr,
  });
}

/// @nodoc
class _$PolicyModelCopyWithImpl<$Res, $Val extends PolicyModel>
    implements $PolicyModelCopyWith<$Res> {
  _$PolicyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contentEn = null,
    Object? contentAr = null,
    Object? titleEn = null,
    Object? titleAr = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            contentEn:
                null == contentEn
                    ? _value.contentEn
                    : contentEn // ignore: cast_nullable_to_non_nullable
                        as String,
            contentAr:
                null == contentAr
                    ? _value.contentAr
                    : contentAr // ignore: cast_nullable_to_non_nullable
                        as String,
            titleEn:
                null == titleEn
                    ? _value.titleEn
                    : titleEn // ignore: cast_nullable_to_non_nullable
                        as String,
            titleAr:
                null == titleAr
                    ? _value.titleAr
                    : titleAr // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PolicyModelImplCopyWith<$Res>
    implements $PolicyModelCopyWith<$Res> {
  factory _$$PolicyModelImplCopyWith(
    _$PolicyModelImpl value,
    $Res Function(_$PolicyModelImpl) then,
  ) = __$$PolicyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String contentEn,
    String contentAr,
    String titleEn,
    String titleAr,
  });
}

/// @nodoc
class __$$PolicyModelImplCopyWithImpl<$Res>
    extends _$PolicyModelCopyWithImpl<$Res, _$PolicyModelImpl>
    implements _$$PolicyModelImplCopyWith<$Res> {
  __$$PolicyModelImplCopyWithImpl(
    _$PolicyModelImpl _value,
    $Res Function(_$PolicyModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contentEn = null,
    Object? contentAr = null,
    Object? titleEn = null,
    Object? titleAr = null,
  }) {
    return _then(
      _$PolicyModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        contentEn:
            null == contentEn
                ? _value.contentEn
                : contentEn // ignore: cast_nullable_to_non_nullable
                    as String,
        contentAr:
            null == contentAr
                ? _value.contentAr
                : contentAr // ignore: cast_nullable_to_non_nullable
                    as String,
        titleEn:
            null == titleEn
                ? _value.titleEn
                : titleEn // ignore: cast_nullable_to_non_nullable
                    as String,
        titleAr:
            null == titleAr
                ? _value.titleAr
                : titleAr // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PolicyModelImpl extends _PolicyModel {
  _$PolicyModelImpl({
    this.id = '',
    this.contentEn = '',
    this.contentAr = '',
    this.titleEn = '',
    this.titleAr = '',
  }) : super._();

  factory _$PolicyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PolicyModelImplFromJson(json);

  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String contentEn;
  @override
  @JsonKey()
  String contentAr;
  @override
  @JsonKey()
  String titleEn;
  @override
  @JsonKey()
  String titleAr;

  @override
  String toString() {
    return 'PolicyModel(id: $id, contentEn: $contentEn, contentAr: $contentAr, titleEn: $titleEn, titleAr: $titleAr)';
  }

  /// Create a copy of PolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PolicyModelImplCopyWith<_$PolicyModelImpl> get copyWith =>
      __$$PolicyModelImplCopyWithImpl<_$PolicyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PolicyModelImplToJson(this);
  }
}

abstract class _PolicyModel extends PolicyModel {
  factory _PolicyModel({
    String id,
    String contentEn,
    String contentAr,
    String titleEn,
    String titleAr,
  }) = _$PolicyModelImpl;
  _PolicyModel._() : super._();

  factory _PolicyModel.fromJson(Map<String, dynamic> json) =
      _$PolicyModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get contentEn;
  set contentEn(String value);
  @override
  String get contentAr;
  set contentAr(String value);
  @override
  String get titleEn;
  set titleEn(String value);
  @override
  String get titleAr;
  set titleAr(String value);

  /// Create a copy of PolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PolicyModelImplCopyWith<_$PolicyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
