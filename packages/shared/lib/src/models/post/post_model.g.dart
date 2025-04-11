// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      id: json['id'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      nameAr: json['nameAr'] as String? ?? '',
      type: json['type'] as String? ?? '',
      item: json['item'] == null
          ? const PostData()
          : PostData.fromJson(json['item'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => PostData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      order: (json['order'] as num?)?.toInt() ?? 0,
      published: json['published'] as bool? ?? true,
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'type': instance.type,
      'item': instance.item.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
      'order': instance.order,
      'published': instance.published,
    };

_$PostDataImpl _$$PostDataImplFromJson(Map<String, dynamic> json) =>
    _$PostDataImpl(
      thumbnail: json['thumbnail'] as String? ?? '',
      categoryIds: (json['categoryIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PostDataImplToJson(_$PostDataImpl instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'categoryIds': instance.categoryIds,
    };
