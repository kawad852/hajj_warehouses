// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      createTime: const TimestampSerializer().fromJson(json['createTime']),
      id: json['id'] as String?,
      prompt: json['prompt'] as String?,
      response: json['response'] as String?,
      status:
          json['status'] == null
              ? null
              : StatusModel.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'createTime': const TimestampSerializer().toJson(instance.createTime),
      'id': instance.id,
      'prompt': instance.prompt,
      'response': instance.response,
      'status': instance.status,
    };

_$StatusModelImpl _$$StatusModelImplFromJson(Map<String, dynamic> json) =>
    _$StatusModelImpl(
      state: json['state'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$StatusModelImplToJson(_$StatusModelImpl instance) =>
    <String, dynamic>{'state': instance.state, 'error': instance.error};

_$AdminMessageModelImpl _$$AdminMessageModelImplFromJson(
  Map<String, dynamic> json,
) => _$AdminMessageModelImpl(
  createTime: const TimestampSerializer().fromJson(json['createTime']),
  id: json['id'] as String?,
  msg: json['msg'] as String?,
);

Map<String, dynamic> _$$AdminMessageModelImplToJson(
  _$AdminMessageModelImpl instance,
) => <String, dynamic>{
  'createTime': const TimestampSerializer().toJson(instance.createTime),
  'id': instance.id,
  'msg': instance.msg,
};
