// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationModelImpl(
  createdAt: const TimestampSerializer().fromJson(json['createdAt']),
  data:
      json['data'] == null
          ? null
          : NotificationDataModel.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
  topic: json['topic'] as String?,
  token: json['token'] as String?,
  notification:
      json['notification'] == null
          ? null
          : NotificationHeaderModel.fromJson(
            json['notification'] as Map<String, dynamic>,
          ),
  priority: json['priority'] as String? ?? "high",
  apns:
      json['apns'] == null
          ? null
          : PayloadModel.fromJson(json['apns'] as Map<String, dynamic>),
  clickAction: json['click_action'] as String? ?? "FLUTTER_NOTIFICATION_CLICK",
);

Map<String, dynamic> _$$NotificationModelImplToJson(
  _$NotificationModelImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'topic': instance.topic,
  'token': instance.token,
  'notification': instance.notification,
  'priority': instance.priority,
  'apns': instance.apns,
  'click_action': instance.clickAction,
};
