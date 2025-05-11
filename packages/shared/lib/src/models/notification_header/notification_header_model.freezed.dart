// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_header_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NotificationHeaderModel _$NotificationHeaderModelFromJson(
  Map<String, dynamic> json,
) {
  return _NotificationHeaderModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationHeaderModel {
  String? get title => throw _privateConstructorUsedError;
  set title(String? value) => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  set body(String? value) => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  set image(String? value) => throw _privateConstructorUsedError;

  /// Serializes this NotificationHeaderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationHeaderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationHeaderModelCopyWith<NotificationHeaderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationHeaderModelCopyWith<$Res> {
  factory $NotificationHeaderModelCopyWith(
    NotificationHeaderModel value,
    $Res Function(NotificationHeaderModel) then,
  ) = _$NotificationHeaderModelCopyWithImpl<$Res, NotificationHeaderModel>;
  @useResult
  $Res call({String? title, String? body, String? image});
}

/// @nodoc
class _$NotificationHeaderModelCopyWithImpl<
  $Res,
  $Val extends NotificationHeaderModel
>
    implements $NotificationHeaderModelCopyWith<$Res> {
  _$NotificationHeaderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationHeaderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? image = freezed,
  }) {
    return _then(
      _value.copyWith(
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            body:
                freezed == body
                    ? _value.body
                    : body // ignore: cast_nullable_to_non_nullable
                        as String?,
            image:
                freezed == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationHeaderModelImplCopyWith<$Res>
    implements $NotificationHeaderModelCopyWith<$Res> {
  factory _$$NotificationHeaderModelImplCopyWith(
    _$NotificationHeaderModelImpl value,
    $Res Function(_$NotificationHeaderModelImpl) then,
  ) = __$$NotificationHeaderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? body, String? image});
}

/// @nodoc
class __$$NotificationHeaderModelImplCopyWithImpl<$Res>
    extends
        _$NotificationHeaderModelCopyWithImpl<
          $Res,
          _$NotificationHeaderModelImpl
        >
    implements _$$NotificationHeaderModelImplCopyWith<$Res> {
  __$$NotificationHeaderModelImplCopyWithImpl(
    _$NotificationHeaderModelImpl _value,
    $Res Function(_$NotificationHeaderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationHeaderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? image = freezed,
  }) {
    return _then(
      _$NotificationHeaderModelImpl(
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        body:
            freezed == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                    as String?,
        image:
            freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationHeaderModelImpl implements _NotificationHeaderModel {
  _$NotificationHeaderModelImpl({this.title, this.body, this.image});

  factory _$NotificationHeaderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationHeaderModelImplFromJson(json);

  @override
  String? title;
  @override
  String? body;
  @override
  String? image;

  @override
  String toString() {
    return 'NotificationHeaderModel(title: $title, body: $body, image: $image)';
  }

  /// Create a copy of NotificationHeaderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationHeaderModelImplCopyWith<_$NotificationHeaderModelImpl>
  get copyWith => __$$NotificationHeaderModelImplCopyWithImpl<
    _$NotificationHeaderModelImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationHeaderModelImplToJson(this);
  }
}

abstract class _NotificationHeaderModel implements NotificationHeaderModel {
  factory _NotificationHeaderModel({
    String? title,
    String? body,
    String? image,
  }) = _$NotificationHeaderModelImpl;

  factory _NotificationHeaderModel.fromJson(Map<String, dynamic> json) =
      _$NotificationHeaderModelImpl.fromJson;

  @override
  String? get title;
  set title(String? value);
  @override
  String? get body;
  set body(String? value);
  @override
  String? get image;
  set image(String? value);

  /// Create a copy of NotificationHeaderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationHeaderModelImplCopyWith<_$NotificationHeaderModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
