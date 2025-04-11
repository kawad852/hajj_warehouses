import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/basket_helper.dart';
import '../../helper/time_stamp_serializer.dart';
import '../../helper/ui_helper.dart';
import '../../utils/app_constants.dart';
import '../review/review_model.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

@unfreezed
class StoreModel with _$StoreModel {
  factory StoreModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default("") String id,
    @Default("") String nameEn,
    @Default("") String nameAr,
    @Default("") String descriptionEn,
    @Default("") String descriptionAr,
    @Default("") String stateId,
    @Default("") String cityId,
    @Default("") String address,
    @Default("PENDING") String status,
    @Default("") String type,
    @Default("") String thumbnail,
    @Default("") String addressEn,
    @Default("") String addressAr,
    @Default("") String startWorkingHour,
    @Default("") String closeWorkingHour,
    @Default([]) List<String> images,
    @Default([]) List<MenuCategoryModel> menuCategories,
    @Default([]) List<String> categoryIds,
    String? phoneNumber,
    @Default(kFallBackCountryCode) String phoneCountryCode,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
    @Default(0.0) double minOrderValue,
    @Default(0.0) double maxDeliveryDistance,
    @Default(false) bool freeDelivery,
    @Default(false) bool canOrderAnyTime,
    List<DeliveryFeeModel>? deliveryFees,
  }) = _StoreModel;
  factory StoreModel.fromJson(Map<String, dynamic> json) => _$StoreModelFromJson(json);

  StoreModel._();

  String get name {
    return UiHelper.translate(textEN: nameEn, textAR: nameAr);
  }

  String get description {
    return UiHelper.translate(textEN: descriptionEn, textAR: descriptionAr);
  }
}

@unfreezed
class MenuCategoryModel with _$MenuCategoryModel {
  factory MenuCategoryModel({
    @Default('') String id,
    @Default('') String nameEn,
    @Default('') String nameAr,
    @Default(0) int order,
  }) = _MenuCategoryModel;

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryModelFromJson(json);

  MenuCategoryModel._();

  String get name {
    return UiHelper.translate(textEN: nameEn, textAR: nameAr);
  }
}

@unfreezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String nameEn,
    @Default('') String nameAr,
    @Default('') String descriptionEn,
    @Default('') String descriptionAr,
    @Default(0.0) double basePrice,
    @Default(kOfferPrice) double discountPrice,
    @Default(1) int basketQuantity,
    @Default(0) int stockQuantity,
    @Default('') String thumbnail,
    @Default('') String categoryId,
    @Default(false) bool inStock,
    @Default(false) bool published,
    @Default(false) bool featured,
    @Default([]) List<MealOptionModel> items,
    @Default([]) List<ColorOption> colors,
    @Default([]) List<SizeOption> sizes,
    @Default([]) List<String> images,
    @Default([]) List<String> tags,
    @Default([]) List<String> categoryIds,
    String? note,
    String? selectedColorId,
    String? selectedSizeId,
    RatingModel? rating,
    DimensionModel? dimensions,
    @JsonKey(includeFromJson: false, includeToJson: false) ReviewModel? review,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  ProductModel._();

  String get name {
    return UiHelper.translate(textEN: nameEn, textAR: nameAr);
  }

  String get description {
    return UiHelper.translate(textEN: descriptionEn, textAR: descriptionAr);
  }

  (double price, double discountPrice, String thumbnail, List<String> images, int stockQuantity)
  get _defaultDetails {
    if (colors.isNotEmpty) {
      final colorOption = colors.firstWhere((e) => e.id == selectedColorId);
      return (
        colorOption.price,
        colorOption.discountPrice,
        colorOption.images.first,
        colorOption.images,
        colorOption.stockQuantity,
      );
    } else if (sizes.isNotEmpty) {
      final sizeOption = sizes.firstWhere((e) => e.id == selectedSizeId);
      return (
        sizeOption.price,
        sizeOption.discountPrice,
        thumbnail,
        images,
        sizeOption.stockQuantity,
      );
    } else {
      return (basePrice, discountPrice, thumbnail, images, stockQuantity);
    }
  }

  (double basePrice, double? discountPrice) get price {
    return BasketHelper.calculatePrice(
      basePrice: _defaultDetails.$1,
      discountPrice: _defaultDetails.$2,
      items: items,
    );
  }

  String get thumbnailURL => _defaultDetails.$3;
  List<String> get getImages => _defaultDetails.$4;
  ColorOption get selectedColor => colors.firstWhere((e) => e.id == selectedColorId);
  SizeOption get selectedSize => sizes.firstWhere((e) => e.id == selectedSizeId);
  int get stockCount => _defaultDetails.$5;
  bool get isOutOfStock => _defaultDetails.$5 <= 0;
  bool stockLessThanQuantity(int basketQuantity) => stockCount < basketQuantity;
}

@unfreezed
class MealOptionModel with _$MealOptionModel {
  factory MealOptionModel({
    @Default('') String id,
    @Default('') String nameEn,
    @Default('') String nameAr,
    @Default('') String type,
    String? selectedId,
    @Default([]) List<String> selectedIds,
    @Default([]) List<OptionItemModel> items,
    @JsonKey(includeToJson: false, includeFromJson: false) Object? globalKey,
  }) = _MealOptionModel;

  factory MealOptionModel.fromJson(Map<String, dynamic> json) => _$MealOptionModelFromJson(json);

  MealOptionModel._();

  String get name {
    return UiHelper.translate(textEN: nameEn, textAR: nameAr);
  }
}

@unfreezed
class OptionItemModel with _$OptionItemModel {
  factory OptionItemModel({
    @Default('') String id,
    @Default('') String nameEn,
    @Default('') String nameAr,
    @Default(0.0) double price,
  }) = _OptionItemModel;

  factory OptionItemModel.fromJson(Map<String, dynamic> json) => _$OptionItemModelFromJson(json);

  OptionItemModel._();

  String get name {
    return UiHelper.translate(textEN: nameEn, textAR: nameAr);
  }
}

@unfreezed
class DeliveryFeeModel with _$DeliveryFeeModel {
  factory DeliveryFeeModel({String? id, double? fee, double? distanceRange}) = _DeliveryFeeModel;

  factory DeliveryFeeModel.fromJson(Map<String, dynamic> json) => _$DeliveryFeeModelFromJson(json);
}

@freezed
class ColorOption with _$ColorOption {
  factory ColorOption({
    @Default('') String id,
    @Default('') String hex,
    @Default('') String name,
    @Default([]) List<String> images,
    @Default(0.0) double price, // optional override
    @Default(0.0) double discountPrice,
    @Default(0) int stockQuantity,
    @Default(true) bool active,
    @Default([]) List<String> sizeIds, // color-specific sizes if present
  }) = _ColorOption;

  factory ColorOption.fromJson(Map<String, dynamic> json) => _$ColorOptionFromJson(json);
}

@freezed
class SizeOption with _$SizeOption {
  factory SizeOption({
    @Default('') String id,
    @Default('') String size,
    @Default(0.0) double price,
    @Default(0.0) double discountPrice,
    @Default(0) int stockQuantity,
    @Default(true) bool active,
  }) = _SizeOption;

  factory SizeOption.fromJson(Map<String, dynamic> json) => _$SizeOptionFromJson(json);
}

@freezed
class DimensionModel with _$DimensionModel {
  factory DimensionModel({
    @Default(0.0) double width,
    @Default(0.0) double height,
    @Default(0.0) double depth,
  }) = _DimensionModel;

  factory DimensionModel.fromJson(Map<String, dynamic> json) => _$DimensionModelFromJson(json);
}

@freezed
class RatingModel with _$RatingModel {
  factory RatingModel({@Default(0) int count, @Default(0.0) double average}) = _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);
}
