// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      comment: json['comment'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 5,
      userId: json['userId'] as String?,
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
      published: json['published'] as bool? ?? false,
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'comment': instance.comment,
      'rating': instance.rating,
      'userId': instance.userId,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'published': instance.published,
    };
