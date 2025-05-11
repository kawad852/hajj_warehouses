// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NotificationDataModel _$NotificationDataModelFromJson(
  Map<String, dynamic> json,
) {
  return _NotificationDataModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationDataModel {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  set type(String? value) => throw _privateConstructorUsedError;

  /// Serializes this NotificationDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationDataModelCopyWith<NotificationDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataModelCopyWith<$Res> {
  factory $NotificationDataModelCopyWith(
    NotificationDataModel value,
    $Res Function(NotificationDataModel) then,
  ) = _$NotificationDataModelCopyWithImpl<$Res, NotificationDataModel>;
  @useResult
  $Res call({String? id, String? type});
}

/// @nodoc
class _$NotificationDataModelCopyWithImpl<
  $Res,
  $Val extends NotificationDataModel
>
    implements $NotificationDataModelCopyWith<$Res> {
  _$NotificationDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? type = freezed}) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            type:
                freezed == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationDataModelImplCopyWith<$Res>
    implements $NotificationDataModelCopyWith<$Res> {
  factory _$$NotificationDataModelImplCopyWith(
    _$NotificationDataModelImpl value,
    $Res Function(_$NotificationDataModelImpl) then,
  ) = __$$NotificationDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? type});
}

/// @nodoc
class __$$NotificationDataModelImplCopyWithImpl<$Res>
    extends
        _$NotificationDataModelCopyWithImpl<$Res, _$NotificationDataModelImpl>
    implements _$$NotificationDataModelImplCopyWith<$Res> {
  __$$NotificationDataModelImplCopyWithImpl(
    _$NotificationDataModelImpl _value,
    $Res Function(_$NotificationDataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? type = freezed}) {
    return _then(
      _$NotificationDataModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        type:
            freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDataModelImpl implements _NotificationDataModel {
  _$NotificationDataModelImpl({this.id, this.type});

  factory _$NotificationDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDataModelImplFromJson(json);

  @override
  String? id;
  @override
  String? type;

  @override
  String toString() {
    return 'NotificationDataModel(id: $id, type: $type)';
  }

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDataModelImplCopyWith<_$NotificationDataModelImpl>
  get copyWith =>
      __$$NotificationDataModelImplCopyWithImpl<_$NotificationDataModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDataModelImplToJson(this);
  }
}

abstract class _NotificationDataModel implements NotificationDataModel {
  factory _NotificationDataModel({String? id, String? type}) =
      _$NotificationDataModelImpl;

  factory _NotificationDataModel.fromJson(Map<String, dynamic> json) =
      _$NotificationDataModelImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get type;
  set type(String? value);

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationDataModelImplCopyWith<_$NotificationDataModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
