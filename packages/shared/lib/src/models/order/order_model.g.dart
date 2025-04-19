// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
      note: json['note'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      status: json['status'] as String,
      urgent: json['urgent'] as bool? ?? false,
      items:
          (json['items'] as List<dynamic>)
              .map((e) => LightItemModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'note': instance.note,
      'userId': instance.userId,
      'status': instance.status,
      'urgent': instance.urgent,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
