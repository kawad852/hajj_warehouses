// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  @TimestampSerializer()
  DateTime? get createTime => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createTime(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get prompt => throw _privateConstructorUsedError;
  set prompt(String? value) => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;
  set response(String? value) => throw _privateConstructorUsedError;
  StatusModel? get status => throw _privateConstructorUsedError;
  set status(StatusModel? value) => throw _privateConstructorUsedError;

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
    MessageModel value,
    $Res Function(MessageModel) then,
  ) = _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createTime,
    String? id,
    String? prompt,
    String? response,
    StatusModel? status,
  });

  $StatusModelCopyWith<$Res>? get status;
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createTime = freezed,
    Object? id = freezed,
    Object? prompt = freezed,
    Object? response = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _value.copyWith(
            createTime:
                freezed == createTime
                    ? _value.createTime
                    : createTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            prompt:
                freezed == prompt
                    ? _value.prompt
                    : prompt // ignore: cast_nullable_to_non_nullable
                        as String?,
            response:
                freezed == response
                    ? _value.response
                    : response // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as StatusModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusModelCopyWith<$Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $StatusModelCopyWith<$Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageModelImplCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$MessageModelImplCopyWith(
    _$MessageModelImpl value,
    $Res Function(_$MessageModelImpl) then,
  ) = __$$MessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createTime,
    String? id,
    String? prompt,
    String? response,
    StatusModel? status,
  });

  @override
  $StatusModelCopyWith<$Res>? get status;
}

/// @nodoc
class __$$MessageModelImplCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$MessageModelImpl>
    implements _$$MessageModelImplCopyWith<$Res> {
  __$$MessageModelImplCopyWithImpl(
    _$MessageModelImpl _value,
    $Res Function(_$MessageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createTime = freezed,
    Object? id = freezed,
    Object? prompt = freezed,
    Object? response = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _$MessageModelImpl(
        createTime:
            freezed == createTime
                ? _value.createTime
                : createTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        prompt:
            freezed == prompt
                ? _value.prompt
                : prompt // ignore: cast_nullable_to_non_nullable
                    as String?,
        response:
            freezed == response
                ? _value.response
                : response // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as StatusModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageModelImpl implements _MessageModel {
  _$MessageModelImpl({
    @TimestampSerializer() this.createTime,
    this.id,
    this.prompt,
    this.response,
    this.status,
  });

  factory _$MessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createTime;
  @override
  String? id;
  @override
  String? prompt;
  @override
  String? response;
  @override
  StatusModel? status;

  @override
  String toString() {
    return 'MessageModel(createTime: $createTime, id: $id, prompt: $prompt, response: $response, status: $status)';
  }

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      __$$MessageModelImplCopyWithImpl<_$MessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageModelImplToJson(this);
  }
}

abstract class _MessageModel implements MessageModel {
  factory _MessageModel({
    @TimestampSerializer() DateTime? createTime,
    String? id,
    String? prompt,
    String? response,
    StatusModel? status,
  }) = _$MessageModelImpl;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$MessageModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createTime;
  @TimestampSerializer()
  set createTime(DateTime? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String? get prompt;
  set prompt(String? value);
  @override
  String? get response;
  set response(String? value);
  @override
  StatusModel? get status;
  set status(StatusModel? value);

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) {
  return _StatusModel.fromJson(json);
}

/// @nodoc
mixin _$StatusModel {
  String? get state => throw _privateConstructorUsedError;
  set state(String? value) => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  set error(String? value) => throw _privateConstructorUsedError;

  /// Serializes this StatusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusModelCopyWith<StatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusModelCopyWith<$Res> {
  factory $StatusModelCopyWith(
    StatusModel value,
    $Res Function(StatusModel) then,
  ) = _$StatusModelCopyWithImpl<$Res, StatusModel>;
  @useResult
  $Res call({String? state, String? error});
}

/// @nodoc
class _$StatusModelCopyWithImpl<$Res, $Val extends StatusModel>
    implements $StatusModelCopyWith<$Res> {
  _$StatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? state = freezed, Object? error = freezed}) {
    return _then(
      _value.copyWith(
            state:
                freezed == state
                    ? _value.state
                    : state // ignore: cast_nullable_to_non_nullable
                        as String?,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StatusModelImplCopyWith<$Res>
    implements $StatusModelCopyWith<$Res> {
  factory _$$StatusModelImplCopyWith(
    _$StatusModelImpl value,
    $Res Function(_$StatusModelImpl) then,
  ) = __$$StatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? state, String? error});
}

/// @nodoc
class __$$StatusModelImplCopyWithImpl<$Res>
    extends _$StatusModelCopyWithImpl<$Res, _$StatusModelImpl>
    implements _$$StatusModelImplCopyWith<$Res> {
  __$$StatusModelImplCopyWithImpl(
    _$StatusModelImpl _value,
    $Res Function(_$StatusModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? state = freezed, Object? error = freezed}) {
    return _then(
      _$StatusModelImpl(
        state:
            freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                    as String?,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusModelImpl implements _StatusModel {
  _$StatusModelImpl({this.state, this.error});

  factory _$StatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusModelImplFromJson(json);

  @override
  String? state;
  @override
  String? error;

  @override
  String toString() {
    return 'StatusModel(state: $state, error: $error)';
  }

  /// Create a copy of StatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusModelImplCopyWith<_$StatusModelImpl> get copyWith =>
      __$$StatusModelImplCopyWithImpl<_$StatusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusModelImplToJson(this);
  }
}

abstract class _StatusModel implements StatusModel {
  factory _StatusModel({String? state, String? error}) = _$StatusModelImpl;

  factory _StatusModel.fromJson(Map<String, dynamic> json) =
      _$StatusModelImpl.fromJson;

  @override
  String? get state;
  set state(String? value);
  @override
  String? get error;
  set error(String? value);

  /// Create a copy of StatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusModelImplCopyWith<_$StatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdminMessageModel _$AdminMessageModelFromJson(Map<String, dynamic> json) {
  return _AdminMessageModel.fromJson(json);
}

/// @nodoc
mixin _$AdminMessageModel {
  @TimestampSerializer()
  DateTime? get createTime => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createTime(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;
  set msg(String? value) => throw _privateConstructorUsedError;

  /// Serializes this AdminMessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminMessageModelCopyWith<AdminMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminMessageModelCopyWith<$Res> {
  factory $AdminMessageModelCopyWith(
    AdminMessageModel value,
    $Res Function(AdminMessageModel) then,
  ) = _$AdminMessageModelCopyWithImpl<$Res, AdminMessageModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createTime,
    String? id,
    String? msg,
  });
}

/// @nodoc
class _$AdminMessageModelCopyWithImpl<$Res, $Val extends AdminMessageModel>
    implements $AdminMessageModelCopyWith<$Res> {
  _$AdminMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createTime = freezed,
    Object? id = freezed,
    Object? msg = freezed,
  }) {
    return _then(
      _value.copyWith(
            createTime:
                freezed == createTime
                    ? _value.createTime
                    : createTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            msg:
                freezed == msg
                    ? _value.msg
                    : msg // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AdminMessageModelImplCopyWith<$Res>
    implements $AdminMessageModelCopyWith<$Res> {
  factory _$$AdminMessageModelImplCopyWith(
    _$AdminMessageModelImpl value,
    $Res Function(_$AdminMessageModelImpl) then,
  ) = __$$AdminMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createTime,
    String? id,
    String? msg,
  });
}

/// @nodoc
class __$$AdminMessageModelImplCopyWithImpl<$Res>
    extends _$AdminMessageModelCopyWithImpl<$Res, _$AdminMessageModelImpl>
    implements _$$AdminMessageModelImplCopyWith<$Res> {
  __$$AdminMessageModelImplCopyWithImpl(
    _$AdminMessageModelImpl _value,
    $Res Function(_$AdminMessageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AdminMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createTime = freezed,
    Object? id = freezed,
    Object? msg = freezed,
  }) {
    return _then(
      _$AdminMessageModelImpl(
        createTime:
            freezed == createTime
                ? _value.createTime
                : createTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        msg:
            freezed == msg
                ? _value.msg
                : msg // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminMessageModelImpl implements _AdminMessageModel {
  _$AdminMessageModelImpl({
    @TimestampSerializer() this.createTime,
    this.id,
    this.msg,
  });

  factory _$AdminMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminMessageModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createTime;
  @override
  String? id;
  @override
  String? msg;

  @override
  String toString() {
    return 'AdminMessageModel(createTime: $createTime, id: $id, msg: $msg)';
  }

  /// Create a copy of AdminMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminMessageModelImplCopyWith<_$AdminMessageModelImpl> get copyWith =>
      __$$AdminMessageModelImplCopyWithImpl<_$AdminMessageModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminMessageModelImplToJson(this);
  }
}

abstract class _AdminMessageModel implements AdminMessageModel {
  factory _AdminMessageModel({
    @TimestampSerializer() DateTime? createTime,
    String? id,
    String? msg,
  }) = _$AdminMessageModelImpl;

  factory _AdminMessageModel.fromJson(Map<String, dynamic> json) =
      _$AdminMessageModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createTime;
  @TimestampSerializer()
  set createTime(DateTime? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String? get msg;
  set msg(String? value);

  /// Create a copy of AdminMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminMessageModelImplCopyWith<_$AdminMessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
