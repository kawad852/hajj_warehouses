// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  @JsonKey(includeToJson: false)
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  NotificationDataModel? get data => throw _privateConstructorUsedError;
  set data(NotificationDataModel? value) => throw _privateConstructorUsedError;
  String? get topic => throw _privateConstructorUsedError;
  set topic(String? value) => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  set token(String? value) => throw _privateConstructorUsedError;
  NotificationHeaderModel? get notification =>
      throw _privateConstructorUsedError;
  set notification(NotificationHeaderModel? value) =>
      throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  set priority(String value) => throw _privateConstructorUsedError;
  PayloadModel? get apns => throw _privateConstructorUsedError;
  set apns(PayloadModel? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'click_action')
  String get clickAction => throw _privateConstructorUsedError;
  @JsonKey(name: 'click_action')
  set clickAction(String value) => throw _privateConstructorUsedError;

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
    NotificationModel value,
    $Res Function(NotificationModel) then,
  ) = _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call({
    @JsonKey(includeToJson: false) @TimestampSerializer() DateTime? createdAt,
    NotificationDataModel? data,
    String? topic,
    String? token,
    NotificationHeaderModel? notification,
    String priority,
    PayloadModel? apns,
    @JsonKey(name: 'click_action') String clickAction,
  });

  $NotificationDataModelCopyWith<$Res>? get data;
  $NotificationHeaderModelCopyWith<$Res>? get notification;
  $PayloadModelCopyWith<$Res>? get apns;
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? data = freezed,
    Object? topic = freezed,
    Object? token = freezed,
    Object? notification = freezed,
    Object? priority = null,
    Object? apns = freezed,
    Object? clickAction = null,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            data:
                freezed == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as NotificationDataModel?,
            topic:
                freezed == topic
                    ? _value.topic
                    : topic // ignore: cast_nullable_to_non_nullable
                        as String?,
            token:
                freezed == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as String?,
            notification:
                freezed == notification
                    ? _value.notification
                    : notification // ignore: cast_nullable_to_non_nullable
                        as NotificationHeaderModel?,
            priority:
                null == priority
                    ? _value.priority
                    : priority // ignore: cast_nullable_to_non_nullable
                        as String,
            apns:
                freezed == apns
                    ? _value.apns
                    : apns // ignore: cast_nullable_to_non_nullable
                        as PayloadModel?,
            clickAction:
                null == clickAction
                    ? _value.clickAction
                    : clickAction // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationDataModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $NotificationDataModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationHeaderModelCopyWith<$Res>? get notification {
    if (_value.notification == null) {
      return null;
    }

    return $NotificationHeaderModelCopyWith<$Res>(_value.notification!, (
      value,
    ) {
      return _then(_value.copyWith(notification: value) as $Val);
    });
  }

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PayloadModelCopyWith<$Res>? get apns {
    if (_value.apns == null) {
      return null;
    }

    return $PayloadModelCopyWith<$Res>(_value.apns!, (value) {
      return _then(_value.copyWith(apns: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(
    _$NotificationModelImpl value,
    $Res Function(_$NotificationModelImpl) then,
  ) = __$$NotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeToJson: false) @TimestampSerializer() DateTime? createdAt,
    NotificationDataModel? data,
    String? topic,
    String? token,
    NotificationHeaderModel? notification,
    String priority,
    PayloadModel? apns,
    @JsonKey(name: 'click_action') String clickAction,
  });

  @override
  $NotificationDataModelCopyWith<$Res>? get data;
  @override
  $NotificationHeaderModelCopyWith<$Res>? get notification;
  @override
  $PayloadModelCopyWith<$Res>? get apns;
}

/// @nodoc
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(
    _$NotificationModelImpl _value,
    $Res Function(_$NotificationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? data = freezed,
    Object? topic = freezed,
    Object? token = freezed,
    Object? notification = freezed,
    Object? priority = null,
    Object? apns = freezed,
    Object? clickAction = null,
  }) {
    return _then(
      _$NotificationModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        data:
            freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as NotificationDataModel?,
        topic:
            freezed == topic
                ? _value.topic
                : topic // ignore: cast_nullable_to_non_nullable
                    as String?,
        token:
            freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String?,
        notification:
            freezed == notification
                ? _value.notification
                : notification // ignore: cast_nullable_to_non_nullable
                    as NotificationHeaderModel?,
        priority:
            null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                    as String,
        apns:
            freezed == apns
                ? _value.apns
                : apns // ignore: cast_nullable_to_non_nullable
                    as PayloadModel?,
        clickAction:
            null == clickAction
                ? _value.clickAction
                : clickAction // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationModelImpl implements _NotificationModel {
  _$NotificationModelImpl({
    @JsonKey(includeToJson: false) @TimestampSerializer() this.createdAt,
    this.data,
    this.topic,
    this.token,
    this.notification,
    this.priority = "high",
    this.apns,
    @JsonKey(name: 'click_action')
    this.clickAction = "FLUTTER_NOTIFICATION_CLICK",
  });

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  NotificationDataModel? data;
  @override
  String? topic;
  @override
  String? token;
  @override
  NotificationHeaderModel? notification;
  @override
  @JsonKey()
  String priority;
  @override
  PayloadModel? apns;
  @override
  @JsonKey(name: 'click_action')
  String clickAction;

  @override
  String toString() {
    return 'NotificationModel(createdAt: $createdAt, data: $data, topic: $topic, token: $token, notification: $notification, priority: $priority, apns: $apns, clickAction: $clickAction)';
  }

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(this);
  }
}

abstract class _NotificationModel implements NotificationModel {
  factory _NotificationModel({
    @JsonKey(includeToJson: false) @TimestampSerializer() DateTime? createdAt,
    NotificationDataModel? data,
    String? topic,
    String? token,
    NotificationHeaderModel? notification,
    String priority,
    PayloadModel? apns,
    @JsonKey(name: 'click_action') String clickAction,
  }) = _$NotificationModelImpl;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  @TimestampSerializer()
  DateTime? get createdAt;
  @JsonKey(includeToJson: false)
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  NotificationDataModel? get data;
  set data(NotificationDataModel? value);
  @override
  String? get topic;
  set topic(String? value);
  @override
  String? get token;
  set token(String? value);
  @override
  NotificationHeaderModel? get notification;
  set notification(NotificationHeaderModel? value);
  @override
  String get priority;
  set priority(String value);
  @override
  PayloadModel? get apns;
  set apns(PayloadModel? value);
  @override
  @JsonKey(name: 'click_action')
  String get clickAction;
  @JsonKey(name: 'click_action')
  set clickAction(String value);

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
