// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      parentCategoryIds:
          (json['parentCategoryIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      order: (json['order'] as num?)?.toInt() ?? kOrder,
      published: json['published'] as bool? ?? true,
      showOnHome: json['showOnHome'] as bool? ?? false,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'parentCategoryIds': instance.parentCategoryIds,
      'order': instance.order,
      'published': instance.published,
      'showOnHome': instance.showOnHome,
    };
