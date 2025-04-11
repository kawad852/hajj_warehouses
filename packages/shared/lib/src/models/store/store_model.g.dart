// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreModelImpl _$$StoreModelImplFromJson(Map<String, dynamic> json) =>
    _$StoreModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? "",
      nameEn: json['nameEn'] as String? ?? "",
      nameAr: json['nameAr'] as String? ?? "",
      descriptionEn: json['descriptionEn'] as String? ?? "",
      descriptionAr: json['descriptionAr'] as String? ?? "",
      stateId: json['stateId'] as String? ?? "",
      cityId: json['cityId'] as String? ?? "",
      address: json['address'] as String? ?? "",
      status: json['status'] as String? ?? "PENDING",
      type: json['type'] as String? ?? "",
      thumbnail: json['thumbnail'] as String? ?? "",
      addressEn: json['addressEn'] as String? ?? "",
      addressAr: json['addressAr'] as String? ?? "",
      startWorkingHour: json['startWorkingHour'] as String? ?? "",
      closeWorkingHour: json['closeWorkingHour'] as String? ?? "",
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      menuCategories: (json['menuCategories'] as List<dynamic>?)
              ?.map(
                  (e) => MenuCategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      categoryIds: (json['categoryIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      phoneNumber: json['phoneNumber'] as String?,
      phoneCountryCode:
          json['phoneCountryCode'] as String? ?? kFallBackCountryCode,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      minOrderValue: (json['minOrderValue'] as num?)?.toDouble() ?? 0.0,
      maxDeliveryDistance:
          (json['maxDeliveryDistance'] as num?)?.toDouble() ?? 0.0,
      freeDelivery: json['freeDelivery'] as bool? ?? false,
      canOrderAnyTime: json['canOrderAnyTime'] as bool? ?? false,
      deliveryFees: (json['deliveryFees'] as List<dynamic>?)
          ?.map((e) => DeliveryFeeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StoreModelImplToJson(_$StoreModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
      'stateId': instance.stateId,
      'cityId': instance.cityId,
      'address': instance.address,
      'status': instance.status,
      'type': instance.type,
      'thumbnail': instance.thumbnail,
      'addressEn': instance.addressEn,
      'addressAr': instance.addressAr,
      'startWorkingHour': instance.startWorkingHour,
      'closeWorkingHour': instance.closeWorkingHour,
      'images': instance.images,
      'menuCategories': instance.menuCategories.map((e) => e.toJson()).toList(),
      'categoryIds': instance.categoryIds,
      'phoneNumber': instance.phoneNumber,
      'phoneCountryCode': instance.phoneCountryCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'minOrderValue': instance.minOrderValue,
      'maxDeliveryDistance': instance.maxDeliveryDistance,
      'freeDelivery': instance.freeDelivery,
      'canOrderAnyTime': instance.canOrderAnyTime,
      'deliveryFees': instance.deliveryFees?.map((e) => e.toJson()).toList(),
    };

_$MenuCategoryModelImpl _$$MenuCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuCategoryModelImpl(
      id: json['id'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      nameAr: json['nameAr'] as String? ?? '',
      order: (json['order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MenuCategoryModelImplToJson(
        _$MenuCategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'order': instance.order,
    };

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      nameAr: json['nameAr'] as String? ?? '',
      descriptionEn: json['descriptionEn'] as String? ?? '',
      descriptionAr: json['descriptionAr'] as String? ?? '',
      basePrice: (json['basePrice'] as num?)?.toDouble() ?? 0.0,
      discountPrice: (json['discountPrice'] as num?)?.toDouble() ?? kOfferPrice,
      basketQuantity: (json['basketQuantity'] as num?)?.toInt() ?? 1,
      stockQuantity: (json['stockQuantity'] as num?)?.toInt() ?? 0,
      thumbnail: json['thumbnail'] as String? ?? '',
      categoryId: json['categoryId'] as String? ?? '',
      inStock: json['inStock'] as bool? ?? false,
      published: json['published'] as bool? ?? false,
      featured: json['featured'] as bool? ?? false,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => MealOptionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      colors: (json['colors'] as List<dynamic>?)
              ?.map((e) => ColorOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sizes: (json['sizes'] as List<dynamic>?)
              ?.map((e) => SizeOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      categoryIds: (json['categoryIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      note: json['note'] as String?,
      selectedColorId: json['selectedColorId'] as String?,
      selectedSizeId: json['selectedSizeId'] as String?,
      rating: json['rating'] == null
          ? null
          : RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
      dimensions: json['dimensions'] == null
          ? null
          : DimensionModel.fromJson(json['dimensions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
      'basePrice': instance.basePrice,
      'discountPrice': instance.discountPrice,
      'basketQuantity': instance.basketQuantity,
      'stockQuantity': instance.stockQuantity,
      'thumbnail': instance.thumbnail,
      'categoryId': instance.categoryId,
      'inStock': instance.inStock,
      'published': instance.published,
      'featured': instance.featured,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'colors': instance.colors.map((e) => e.toJson()).toList(),
      'sizes': instance.sizes.map((e) => e.toJson()).toList(),
      'images': instance.images,
      'tags': instance.tags,
      'categoryIds': instance.categoryIds,
      'note': instance.note,
      'selectedColorId': instance.selectedColorId,
      'selectedSizeId': instance.selectedSizeId,
      'rating': instance.rating?.toJson(),
      'dimensions': instance.dimensions?.toJson(),
    };

_$MealOptionModelImpl _$$MealOptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MealOptionModelImpl(
      id: json['id'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      nameAr: json['nameAr'] as String? ?? '',
      type: json['type'] as String? ?? '',
      selectedId: json['selectedId'] as String?,
      selectedIds: (json['selectedIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => OptionItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MealOptionModelImplToJson(
        _$MealOptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'type': instance.type,
      'selectedId': instance.selectedId,
      'selectedIds': instance.selectedIds,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

_$OptionItemModelImpl _$$OptionItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OptionItemModelImpl(
      id: json['id'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      nameAr: json['nameAr'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$OptionItemModelImplToJson(
        _$OptionItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'price': instance.price,
    };

_$DeliveryFeeModelImpl _$$DeliveryFeeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryFeeModelImpl(
      id: json['id'] as String?,
      fee: (json['fee'] as num?)?.toDouble(),
      distanceRange: (json['distanceRange'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DeliveryFeeModelImplToJson(
        _$DeliveryFeeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fee': instance.fee,
      'distanceRange': instance.distanceRange,
    };

_$ColorOptionImpl _$$ColorOptionImplFromJson(Map<String, dynamic> json) =>
    _$ColorOptionImpl(
      id: json['id'] as String? ?? '',
      hex: json['hex'] as String? ?? '',
      name: json['name'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPrice: (json['discountPrice'] as num?)?.toDouble() ?? 0.0,
      stockQuantity: (json['stockQuantity'] as num?)?.toInt() ?? 0,
      active: json['active'] as bool? ?? true,
      sizeIds: (json['sizeIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ColorOptionImplToJson(_$ColorOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hex': instance.hex,
      'name': instance.name,
      'images': instance.images,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'stockQuantity': instance.stockQuantity,
      'active': instance.active,
      'sizeIds': instance.sizeIds,
    };

_$SizeOptionImpl _$$SizeOptionImplFromJson(Map<String, dynamic> json) =>
    _$SizeOptionImpl(
      id: json['id'] as String? ?? '',
      size: json['size'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPrice: (json['discountPrice'] as num?)?.toDouble() ?? 0.0,
      stockQuantity: (json['stockQuantity'] as num?)?.toInt() ?? 0,
      active: json['active'] as bool? ?? true,
    );

Map<String, dynamic> _$$SizeOptionImplToJson(_$SizeOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'stockQuantity': instance.stockQuantity,
      'active': instance.active,
    };

_$DimensionModelImpl _$$DimensionModelImplFromJson(Map<String, dynamic> json) =>
    _$DimensionModelImpl(
      width: (json['width'] as num?)?.toDouble() ?? 0.0,
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      depth: (json['depth'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$DimensionModelImplToJson(
        _$DimensionModelImpl instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };

_$RatingModelImpl _$$RatingModelImplFromJson(Map<String, dynamic> json) =>
    _$RatingModelImpl(
      count: (json['count'] as num?)?.toInt() ?? 0,
      average: (json['average'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$RatingModelImplToJson(_$RatingModelImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'average': instance.average,
    };
