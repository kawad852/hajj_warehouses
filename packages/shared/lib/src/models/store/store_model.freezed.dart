// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) {
  return _StoreModel.fromJson(json);
}

/// @nodoc
mixin _$StoreModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  set nameEn(String value) => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  set nameAr(String value) => throw _privateConstructorUsedError;
  String get descriptionEn => throw _privateConstructorUsedError;
  set descriptionEn(String value) => throw _privateConstructorUsedError;
  String get descriptionAr => throw _privateConstructorUsedError;
  set descriptionAr(String value) => throw _privateConstructorUsedError;
  String get stateId => throw _privateConstructorUsedError;
  set stateId(String value) => throw _privateConstructorUsedError;
  String get cityId => throw _privateConstructorUsedError;
  set cityId(String value) => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  set address(String value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  set thumbnail(String value) => throw _privateConstructorUsedError;
  String get addressEn => throw _privateConstructorUsedError;
  set addressEn(String value) => throw _privateConstructorUsedError;
  String get addressAr => throw _privateConstructorUsedError;
  set addressAr(String value) => throw _privateConstructorUsedError;
  String get startWorkingHour => throw _privateConstructorUsedError;
  set startWorkingHour(String value) => throw _privateConstructorUsedError;
  String get closeWorkingHour => throw _privateConstructorUsedError;
  set closeWorkingHour(String value) => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  set images(List<String> value) => throw _privateConstructorUsedError;
  List<MenuCategoryModel> get menuCategories =>
      throw _privateConstructorUsedError;
  set menuCategories(List<MenuCategoryModel> value) =>
      throw _privateConstructorUsedError;
  List<String> get categoryIds => throw _privateConstructorUsedError;
  set categoryIds(List<String> value) => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  set phoneNumber(String? value) => throw _privateConstructorUsedError;
  String get phoneCountryCode => throw _privateConstructorUsedError;
  set phoneCountryCode(String value) => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  set latitude(double value) => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  set longitude(double value) => throw _privateConstructorUsedError;
  double get minOrderValue => throw _privateConstructorUsedError;
  set minOrderValue(double value) => throw _privateConstructorUsedError;
  double get maxDeliveryDistance => throw _privateConstructorUsedError;
  set maxDeliveryDistance(double value) => throw _privateConstructorUsedError;
  bool get freeDelivery => throw _privateConstructorUsedError;
  set freeDelivery(bool value) => throw _privateConstructorUsedError;
  bool get canOrderAnyTime => throw _privateConstructorUsedError;
  set canOrderAnyTime(bool value) => throw _privateConstructorUsedError;
  List<DeliveryFeeModel>? get deliveryFees =>
      throw _privateConstructorUsedError;
  set deliveryFees(List<DeliveryFeeModel>? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this StoreModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreModelCopyWith<StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreModelCopyWith<$Res> {
  factory $StoreModelCopyWith(
          StoreModel value, $Res Function(StoreModel) then) =
      _$StoreModelCopyWithImpl<$Res, StoreModel>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String id,
      String nameEn,
      String nameAr,
      String descriptionEn,
      String descriptionAr,
      String stateId,
      String cityId,
      String address,
      String status,
      String type,
      String thumbnail,
      String addressEn,
      String addressAr,
      String startWorkingHour,
      String closeWorkingHour,
      List<String> images,
      List<MenuCategoryModel> menuCategories,
      List<String> categoryIds,
      String? phoneNumber,
      String phoneCountryCode,
      double latitude,
      double longitude,
      double minOrderValue,
      double maxDeliveryDistance,
      bool freeDelivery,
      bool canOrderAnyTime,
      List<DeliveryFeeModel>? deliveryFees});
}

/// @nodoc
class _$StoreModelCopyWithImpl<$Res, $Val extends StoreModel>
    implements $StoreModelCopyWith<$Res> {
  _$StoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? descriptionEn = null,
    Object? descriptionAr = null,
    Object? stateId = null,
    Object? cityId = null,
    Object? address = null,
    Object? status = null,
    Object? type = null,
    Object? thumbnail = null,
    Object? addressEn = null,
    Object? addressAr = null,
    Object? startWorkingHour = null,
    Object? closeWorkingHour = null,
    Object? images = null,
    Object? menuCategories = null,
    Object? categoryIds = null,
    Object? phoneNumber = freezed,
    Object? phoneCountryCode = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? minOrderValue = null,
    Object? maxDeliveryDistance = null,
    Object? freeDelivery = null,
    Object? canOrderAnyTime = null,
    Object? deliveryFees = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionEn: null == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionAr: null == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String,
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      cityId: null == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      addressEn: null == addressEn
          ? _value.addressEn
          : addressEn // ignore: cast_nullable_to_non_nullable
              as String,
      addressAr: null == addressAr
          ? _value.addressAr
          : addressAr // ignore: cast_nullable_to_non_nullable
              as String,
      startWorkingHour: null == startWorkingHour
          ? _value.startWorkingHour
          : startWorkingHour // ignore: cast_nullable_to_non_nullable
              as String,
      closeWorkingHour: null == closeWorkingHour
          ? _value.closeWorkingHour
          : closeWorkingHour // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      menuCategories: null == menuCategories
          ? _value.menuCategories
          : menuCategories // ignore: cast_nullable_to_non_nullable
              as List<MenuCategoryModel>,
      categoryIds: null == categoryIds
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCountryCode: null == phoneCountryCode
          ? _value.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      minOrderValue: null == minOrderValue
          ? _value.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxDeliveryDistance: null == maxDeliveryDistance
          ? _value.maxDeliveryDistance
          : maxDeliveryDistance // ignore: cast_nullable_to_non_nullable
              as double,
      freeDelivery: null == freeDelivery
          ? _value.freeDelivery
          : freeDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      canOrderAnyTime: null == canOrderAnyTime
          ? _value.canOrderAnyTime
          : canOrderAnyTime // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryFees: freezed == deliveryFees
          ? _value.deliveryFees
          : deliveryFees // ignore: cast_nullable_to_non_nullable
              as List<DeliveryFeeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreModelImplCopyWith<$Res>
    implements $StoreModelCopyWith<$Res> {
  factory _$$StoreModelImplCopyWith(
          _$StoreModelImpl value, $Res Function(_$StoreModelImpl) then) =
      __$$StoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String id,
      String nameEn,
      String nameAr,
      String descriptionEn,
      String descriptionAr,
      String stateId,
      String cityId,
      String address,
      String status,
      String type,
      String thumbnail,
      String addressEn,
      String addressAr,
      String startWorkingHour,
      String closeWorkingHour,
      List<String> images,
      List<MenuCategoryModel> menuCategories,
      List<String> categoryIds,
      String? phoneNumber,
      String phoneCountryCode,
      double latitude,
      double longitude,
      double minOrderValue,
      double maxDeliveryDistance,
      bool freeDelivery,
      bool canOrderAnyTime,
      List<DeliveryFeeModel>? deliveryFees});
}

/// @nodoc
class __$$StoreModelImplCopyWithImpl<$Res>
    extends _$StoreModelCopyWithImpl<$Res, _$StoreModelImpl>
    implements _$$StoreModelImplCopyWith<$Res> {
  __$$StoreModelImplCopyWithImpl(
      _$StoreModelImpl _value, $Res Function(_$StoreModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? descriptionEn = null,
    Object? descriptionAr = null,
    Object? stateId = null,
    Object? cityId = null,
    Object? address = null,
    Object? status = null,
    Object? type = null,
    Object? thumbnail = null,
    Object? addressEn = null,
    Object? addressAr = null,
    Object? startWorkingHour = null,
    Object? closeWorkingHour = null,
    Object? images = null,
    Object? menuCategories = null,
    Object? categoryIds = null,
    Object? phoneNumber = freezed,
    Object? phoneCountryCode = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? minOrderValue = null,
    Object? maxDeliveryDistance = null,
    Object? freeDelivery = null,
    Object? canOrderAnyTime = null,
    Object? deliveryFees = freezed,
  }) {
    return _then(_$StoreModelImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionEn: null == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionAr: null == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String,
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      cityId: null == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      addressEn: null == addressEn
          ? _value.addressEn
          : addressEn // ignore: cast_nullable_to_non_nullable
              as String,
      addressAr: null == addressAr
          ? _value.addressAr
          : addressAr // ignore: cast_nullable_to_non_nullable
              as String,
      startWorkingHour: null == startWorkingHour
          ? _value.startWorkingHour
          : startWorkingHour // ignore: cast_nullable_to_non_nullable
              as String,
      closeWorkingHour: null == closeWorkingHour
          ? _value.closeWorkingHour
          : closeWorkingHour // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      menuCategories: null == menuCategories
          ? _value.menuCategories
          : menuCategories // ignore: cast_nullable_to_non_nullable
              as List<MenuCategoryModel>,
      categoryIds: null == categoryIds
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCountryCode: null == phoneCountryCode
          ? _value.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      minOrderValue: null == minOrderValue
          ? _value.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxDeliveryDistance: null == maxDeliveryDistance
          ? _value.maxDeliveryDistance
          : maxDeliveryDistance // ignore: cast_nullable_to_non_nullable
              as double,
      freeDelivery: null == freeDelivery
          ? _value.freeDelivery
          : freeDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      canOrderAnyTime: null == canOrderAnyTime
          ? _value.canOrderAnyTime
          : canOrderAnyTime // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryFees: freezed == deliveryFees
          ? _value.deliveryFees
          : deliveryFees // ignore: cast_nullable_to_non_nullable
              as List<DeliveryFeeModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreModelImpl extends _StoreModel {
  _$StoreModelImpl(
      {@TimestampSerializer() this.createdAt,
      this.id = "",
      this.nameEn = "",
      this.nameAr = "",
      this.descriptionEn = "",
      this.descriptionAr = "",
      this.stateId = "",
      this.cityId = "",
      this.address = "",
      this.status = "PENDING",
      this.type = "",
      this.thumbnail = "",
      this.addressEn = "",
      this.addressAr = "",
      this.startWorkingHour = "",
      this.closeWorkingHour = "",
      this.images = const [],
      this.menuCategories = const [],
      this.categoryIds = const [],
      this.phoneNumber,
      this.phoneCountryCode = kFallBackCountryCode,
      this.latitude = 0.0,
      this.longitude = 0.0,
      this.minOrderValue = 0.0,
      this.maxDeliveryDistance = 0.0,
      this.freeDelivery = false,
      this.canOrderAnyTime = false,
      this.deliveryFees})
      : super._();

  factory _$StoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String nameEn;
  @override
  @JsonKey()
  String nameAr;
  @override
  @JsonKey()
  String descriptionEn;
  @override
  @JsonKey()
  String descriptionAr;
  @override
  @JsonKey()
  String stateId;
  @override
  @JsonKey()
  String cityId;
  @override
  @JsonKey()
  String address;
  @override
  @JsonKey()
  String status;
  @override
  @JsonKey()
  String type;
  @override
  @JsonKey()
  String thumbnail;
  @override
  @JsonKey()
  String addressEn;
  @override
  @JsonKey()
  String addressAr;
  @override
  @JsonKey()
  String startWorkingHour;
  @override
  @JsonKey()
  String closeWorkingHour;
  @override
  @JsonKey()
  List<String> images;
  @override
  @JsonKey()
  List<MenuCategoryModel> menuCategories;
  @override
  @JsonKey()
  List<String> categoryIds;
  @override
  String? phoneNumber;
  @override
  @JsonKey()
  String phoneCountryCode;
  @override
  @JsonKey()
  double latitude;
  @override
  @JsonKey()
  double longitude;
  @override
  @JsonKey()
  double minOrderValue;
  @override
  @JsonKey()
  double maxDeliveryDistance;
  @override
  @JsonKey()
  bool freeDelivery;
  @override
  @JsonKey()
  bool canOrderAnyTime;
  @override
  List<DeliveryFeeModel>? deliveryFees;

  @override
  String toString() {
    return 'StoreModel(createdAt: $createdAt, id: $id, nameEn: $nameEn, nameAr: $nameAr, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, stateId: $stateId, cityId: $cityId, address: $address, status: $status, type: $type, thumbnail: $thumbnail, addressEn: $addressEn, addressAr: $addressAr, startWorkingHour: $startWorkingHour, closeWorkingHour: $closeWorkingHour, images: $images, menuCategories: $menuCategories, categoryIds: $categoryIds, phoneNumber: $phoneNumber, phoneCountryCode: $phoneCountryCode, latitude: $latitude, longitude: $longitude, minOrderValue: $minOrderValue, maxDeliveryDistance: $maxDeliveryDistance, freeDelivery: $freeDelivery, canOrderAnyTime: $canOrderAnyTime, deliveryFees: $deliveryFees)';
  }

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreModelImplCopyWith<_$StoreModelImpl> get copyWith =>
      __$$StoreModelImplCopyWithImpl<_$StoreModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreModelImplToJson(
      this,
    );
  }
}

abstract class _StoreModel extends StoreModel {
  factory _StoreModel(
      {@TimestampSerializer() DateTime? createdAt,
      String id,
      String nameEn,
      String nameAr,
      String descriptionEn,
      String descriptionAr,
      String stateId,
      String cityId,
      String address,
      String status,
      String type,
      String thumbnail,
      String addressEn,
      String addressAr,
      String startWorkingHour,
      String closeWorkingHour,
      List<String> images,
      List<MenuCategoryModel> menuCategories,
      List<String> categoryIds,
      String? phoneNumber,
      String phoneCountryCode,
      double latitude,
      double longitude,
      double minOrderValue,
      double maxDeliveryDistance,
      bool freeDelivery,
      bool canOrderAnyTime,
      List<DeliveryFeeModel>? deliveryFees}) = _$StoreModelImpl;
  _StoreModel._() : super._();

  factory _StoreModel.fromJson(Map<String, dynamic> json) =
      _$StoreModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  String get nameEn;
  set nameEn(String value);
  @override
  String get nameAr;
  set nameAr(String value);
  @override
  String get descriptionEn;
  set descriptionEn(String value);
  @override
  String get descriptionAr;
  set descriptionAr(String value);
  @override
  String get stateId;
  set stateId(String value);
  @override
  String get cityId;
  set cityId(String value);
  @override
  String get address;
  set address(String value);
  @override
  String get status;
  set status(String value);
  @override
  String get type;
  set type(String value);
  @override
  String get thumbnail;
  set thumbnail(String value);
  @override
  String get addressEn;
  set addressEn(String value);
  @override
  String get addressAr;
  set addressAr(String value);
  @override
  String get startWorkingHour;
  set startWorkingHour(String value);
  @override
  String get closeWorkingHour;
  set closeWorkingHour(String value);
  @override
  List<String> get images;
  set images(List<String> value);
  @override
  List<MenuCategoryModel> get menuCategories;
  set menuCategories(List<MenuCategoryModel> value);
  @override
  List<String> get categoryIds;
  set categoryIds(List<String> value);
  @override
  String? get phoneNumber;
  set phoneNumber(String? value);
  @override
  String get phoneCountryCode;
  set phoneCountryCode(String value);
  @override
  double get latitude;
  set latitude(double value);
  @override
  double get longitude;
  set longitude(double value);
  @override
  double get minOrderValue;
  set minOrderValue(double value);
  @override
  double get maxDeliveryDistance;
  set maxDeliveryDistance(double value);
  @override
  bool get freeDelivery;
  set freeDelivery(bool value);
  @override
  bool get canOrderAnyTime;
  set canOrderAnyTime(bool value);
  @override
  List<DeliveryFeeModel>? get deliveryFees;
  set deliveryFees(List<DeliveryFeeModel>? value);

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreModelImplCopyWith<_$StoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuCategoryModel _$MenuCategoryModelFromJson(Map<String, dynamic> json) {
  return _MenuCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$MenuCategoryModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  set nameEn(String value) => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  set nameAr(String value) => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  set order(int value) => throw _privateConstructorUsedError;

  /// Serializes this MenuCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuCategoryModelCopyWith<MenuCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCategoryModelCopyWith<$Res> {
  factory $MenuCategoryModelCopyWith(
          MenuCategoryModel value, $Res Function(MenuCategoryModel) then) =
      _$MenuCategoryModelCopyWithImpl<$Res, MenuCategoryModel>;
  @useResult
  $Res call({String id, String nameEn, String nameAr, int order});
}

/// @nodoc
class _$MenuCategoryModelCopyWithImpl<$Res, $Val extends MenuCategoryModel>
    implements $MenuCategoryModelCopyWith<$Res> {
  _$MenuCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuCategoryModelImplCopyWith<$Res>
    implements $MenuCategoryModelCopyWith<$Res> {
  factory _$$MenuCategoryModelImplCopyWith(_$MenuCategoryModelImpl value,
          $Res Function(_$MenuCategoryModelImpl) then) =
      __$$MenuCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nameEn, String nameAr, int order});
}

/// @nodoc
class __$$MenuCategoryModelImplCopyWithImpl<$Res>
    extends _$MenuCategoryModelCopyWithImpl<$Res, _$MenuCategoryModelImpl>
    implements _$$MenuCategoryModelImplCopyWith<$Res> {
  __$$MenuCategoryModelImplCopyWithImpl(_$MenuCategoryModelImpl _value,
      $Res Function(_$MenuCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? order = null,
  }) {
    return _then(_$MenuCategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuCategoryModelImpl extends _MenuCategoryModel {
  _$MenuCategoryModelImpl(
      {this.id = '', this.nameEn = '', this.nameAr = '', this.order = 0})
      : super._();

  factory _$MenuCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuCategoryModelImplFromJson(json);

  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String nameEn;
  @override
  @JsonKey()
  String nameAr;
  @override
  @JsonKey()
  int order;

  @override
  String toString() {
    return 'MenuCategoryModel(id: $id, nameEn: $nameEn, nameAr: $nameAr, order: $order)';
  }

  /// Create a copy of MenuCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuCategoryModelImplCopyWith<_$MenuCategoryModelImpl> get copyWith =>
      __$$MenuCategoryModelImplCopyWithImpl<_$MenuCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _MenuCategoryModel extends MenuCategoryModel {
  factory _MenuCategoryModel(
      {String id,
      String nameEn,
      String nameAr,
      int order}) = _$MenuCategoryModelImpl;
  _MenuCategoryModel._() : super._();

  factory _MenuCategoryModel.fromJson(Map<String, dynamic> json) =
      _$MenuCategoryModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get nameEn;
  set nameEn(String value);
  @override
  String get nameAr;
  set nameAr(String value);
  @override
  int get order;
  set order(int value);

  /// Create a copy of MenuCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuCategoryModelImplCopyWith<_$MenuCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  set nameEn(String value) => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  set nameAr(String value) => throw _privateConstructorUsedError;
  String get descriptionEn => throw _privateConstructorUsedError;
  set descriptionEn(String value) => throw _privateConstructorUsedError;
  String get descriptionAr => throw _privateConstructorUsedError;
  set descriptionAr(String value) => throw _privateConstructorUsedError;
  double get basePrice => throw _privateConstructorUsedError;
  set basePrice(double value) => throw _privateConstructorUsedError;
  double get discountPrice => throw _privateConstructorUsedError;
  set discountPrice(double value) => throw _privateConstructorUsedError;
  int get basketQuantity => throw _privateConstructorUsedError;
  set basketQuantity(int value) => throw _privateConstructorUsedError;
  int get stockQuantity => throw _privateConstructorUsedError;
  set stockQuantity(int value) => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  set thumbnail(String value) => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  set categoryId(String value) => throw _privateConstructorUsedError;
  bool get inStock => throw _privateConstructorUsedError;
  set inStock(bool value) => throw _privateConstructorUsedError;
  bool get published => throw _privateConstructorUsedError;
  set published(bool value) => throw _privateConstructorUsedError;
  bool get featured => throw _privateConstructorUsedError;
  set featured(bool value) => throw _privateConstructorUsedError;
  List<MealOptionModel> get items => throw _privateConstructorUsedError;
  set items(List<MealOptionModel> value) => throw _privateConstructorUsedError;
  List<ColorOption> get colors => throw _privateConstructorUsedError;
  set colors(List<ColorOption> value) => throw _privateConstructorUsedError;
  List<SizeOption> get sizes => throw _privateConstructorUsedError;
  set sizes(List<SizeOption> value) => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  set images(List<String> value) => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  set tags(List<String> value) => throw _privateConstructorUsedError;
  List<String> get categoryIds => throw _privateConstructorUsedError;
  set categoryIds(List<String> value) => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  set note(String? value) => throw _privateConstructorUsedError;
  String? get selectedColorId => throw _privateConstructorUsedError;
  set selectedColorId(String? value) => throw _privateConstructorUsedError;
  String? get selectedSizeId => throw _privateConstructorUsedError;
  set selectedSizeId(String? value) => throw _privateConstructorUsedError;
  RatingModel? get rating => throw _privateConstructorUsedError;
  set rating(RatingModel? value) => throw _privateConstructorUsedError;
  DimensionModel? get dimensions => throw _privateConstructorUsedError;
  set dimensions(DimensionModel? value) => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  ReviewModel? get review => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  set review(ReviewModel? value) => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String id,
      String nameEn,
      String nameAr,
      String descriptionEn,
      String descriptionAr,
      double basePrice,
      double discountPrice,
      int basketQuantity,
      int stockQuantity,
      String thumbnail,
      String categoryId,
      bool inStock,
      bool published,
      bool featured,
      List<MealOptionModel> items,
      List<ColorOption> colors,
      List<SizeOption> sizes,
      List<String> images,
      List<String> tags,
      List<String> categoryIds,
      String? note,
      String? selectedColorId,
      String? selectedSizeId,
      RatingModel? rating,
      DimensionModel? dimensions,
      @JsonKey(includeFromJson: false, includeToJson: false)
      ReviewModel? review});

  $RatingModelCopyWith<$Res>? get rating;
  $DimensionModelCopyWith<$Res>? get dimensions;
  $ReviewModelCopyWith<$Res>? get review;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? descriptionEn = null,
    Object? descriptionAr = null,
    Object? basePrice = null,
    Object? discountPrice = null,
    Object? basketQuantity = null,
    Object? stockQuantity = null,
    Object? thumbnail = null,
    Object? categoryId = null,
    Object? inStock = null,
    Object? published = null,
    Object? featured = null,
    Object? items = null,
    Object? colors = null,
    Object? sizes = null,
    Object? images = null,
    Object? tags = null,
    Object? categoryIds = null,
    Object? note = freezed,
    Object? selectedColorId = freezed,
    Object? selectedSizeId = freezed,
    Object? rating = freezed,
    Object? dimensions = freezed,
    Object? review = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionEn: null == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionAr: null == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      basketQuantity: null == basketQuantity
          ? _value.basketQuantity
          : basketQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as bool,
      published: null == published
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as bool,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MealOptionModel>,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ColorOption>,
      sizes: null == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<SizeOption>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryIds: null == categoryIds
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedColorId: freezed == selectedColorId
          ? _value.selectedColorId
          : selectedColorId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedSizeId: freezed == selectedSizeId
          ? _value.selectedSizeId
          : selectedSizeId // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RatingModel?,
      dimensions: freezed == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as DimensionModel?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewModel?,
    ) as $Val);
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RatingModelCopyWith<$Res>? get rating {
    if (_value.rating == null) {
      return null;
    }

    return $RatingModelCopyWith<$Res>(_value.rating!, (value) {
      return _then(_value.copyWith(rating: value) as $Val);
    });
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DimensionModelCopyWith<$Res>? get dimensions {
    if (_value.dimensions == null) {
      return null;
    }

    return $DimensionModelCopyWith<$Res>(_value.dimensions!, (value) {
      return _then(_value.copyWith(dimensions: value) as $Val);
    });
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewModelCopyWith<$Res>? get review {
    if (_value.review == null) {
      return null;
    }

    return $ReviewModelCopyWith<$Res>(_value.review!, (value) {
      return _then(_value.copyWith(review: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String id,
      String nameEn,
      String nameAr,
      String descriptionEn,
      String descriptionAr,
      double basePrice,
      double discountPrice,
      int basketQuantity,
      int stockQuantity,
      String thumbnail,
      String categoryId,
      bool inStock,
      bool published,
      bool featured,
      List<MealOptionModel> items,
      List<ColorOption> colors,
      List<SizeOption> sizes,
      List<String> images,
      List<String> tags,
      List<String> categoryIds,
      String? note,
      String? selectedColorId,
      String? selectedSizeId,
      RatingModel? rating,
      DimensionModel? dimensions,
      @JsonKey(includeFromJson: false, includeToJson: false)
      ReviewModel? review});

  @override
  $RatingModelCopyWith<$Res>? get rating;
  @override
  $DimensionModelCopyWith<$Res>? get dimensions;
  @override
  $ReviewModelCopyWith<$Res>? get review;
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? descriptionEn = null,
    Object? descriptionAr = null,
    Object? basePrice = null,
    Object? discountPrice = null,
    Object? basketQuantity = null,
    Object? stockQuantity = null,
    Object? thumbnail = null,
    Object? categoryId = null,
    Object? inStock = null,
    Object? published = null,
    Object? featured = null,
    Object? items = null,
    Object? colors = null,
    Object? sizes = null,
    Object? images = null,
    Object? tags = null,
    Object? categoryIds = null,
    Object? note = freezed,
    Object? selectedColorId = freezed,
    Object? selectedSizeId = freezed,
    Object? rating = freezed,
    Object? dimensions = freezed,
    Object? review = freezed,
  }) {
    return _then(_$ProductModelImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionEn: null == descriptionEn
          ? _value.descriptionEn
          : descriptionEn // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionAr: null == descriptionAr
          ? _value.descriptionAr
          : descriptionAr // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      basketQuantity: null == basketQuantity
          ? _value.basketQuantity
          : basketQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as bool,
      published: null == published
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as bool,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MealOptionModel>,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ColorOption>,
      sizes: null == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as List<SizeOption>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categoryIds: null == categoryIds
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedColorId: freezed == selectedColorId
          ? _value.selectedColorId
          : selectedColorId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedSizeId: freezed == selectedSizeId
          ? _value.selectedSizeId
          : selectedSizeId // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RatingModel?,
      dimensions: freezed == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as DimensionModel?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl extends _ProductModel {
  _$ProductModelImpl(
      {@TimestampSerializer() this.createdAt,
      this.id = '',
      this.nameEn = '',
      this.nameAr = '',
      this.descriptionEn = '',
      this.descriptionAr = '',
      this.basePrice = 0.0,
      this.discountPrice = kOfferPrice,
      this.basketQuantity = 1,
      this.stockQuantity = 0,
      this.thumbnail = '',
      this.categoryId = '',
      this.inStock = false,
      this.published = false,
      this.featured = false,
      this.items = const [],
      this.colors = const [],
      this.sizes = const [],
      this.images = const [],
      this.tags = const [],
      this.categoryIds = const [],
      this.note,
      this.selectedColorId,
      this.selectedSizeId,
      this.rating,
      this.dimensions,
      @JsonKey(includeFromJson: false, includeToJson: false) this.review})
      : super._();

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String nameEn;
  @override
  @JsonKey()
  String nameAr;
  @override
  @JsonKey()
  String descriptionEn;
  @override
  @JsonKey()
  String descriptionAr;
  @override
  @JsonKey()
  double basePrice;
  @override
  @JsonKey()
  double discountPrice;
  @override
  @JsonKey()
  int basketQuantity;
  @override
  @JsonKey()
  int stockQuantity;
  @override
  @JsonKey()
  String thumbnail;
  @override
  @JsonKey()
  String categoryId;
  @override
  @JsonKey()
  bool inStock;
  @override
  @JsonKey()
  bool published;
  @override
  @JsonKey()
  bool featured;
  @override
  @JsonKey()
  List<MealOptionModel> items;
  @override
  @JsonKey()
  List<ColorOption> colors;
  @override
  @JsonKey()
  List<SizeOption> sizes;
  @override
  @JsonKey()
  List<String> images;
  @override
  @JsonKey()
  List<String> tags;
  @override
  @JsonKey()
  List<String> categoryIds;
  @override
  String? note;
  @override
  String? selectedColorId;
  @override
  String? selectedSizeId;
  @override
  RatingModel? rating;
  @override
  DimensionModel? dimensions;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  ReviewModel? review;

  @override
  String toString() {
    return 'ProductModel(createdAt: $createdAt, id: $id, nameEn: $nameEn, nameAr: $nameAr, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, basePrice: $basePrice, discountPrice: $discountPrice, basketQuantity: $basketQuantity, stockQuantity: $stockQuantity, thumbnail: $thumbnail, categoryId: $categoryId, inStock: $inStock, published: $published, featured: $featured, items: $items, colors: $colors, sizes: $sizes, images: $images, tags: $tags, categoryIds: $categoryIds, note: $note, selectedColorId: $selectedColorId, selectedSizeId: $selectedSizeId, rating: $rating, dimensions: $dimensions, review: $review)';
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel extends ProductModel {
  factory _ProductModel(
      {@TimestampSerializer() DateTime? createdAt,
      String id,
      String nameEn,
      String nameAr,
      String descriptionEn,
      String descriptionAr,
      double basePrice,
      double discountPrice,
      int basketQuantity,
      int stockQuantity,
      String thumbnail,
      String categoryId,
      bool inStock,
      bool published,
      bool featured,
      List<MealOptionModel> items,
      List<ColorOption> colors,
      List<SizeOption> sizes,
      List<String> images,
      List<String> tags,
      List<String> categoryIds,
      String? note,
      String? selectedColorId,
      String? selectedSizeId,
      RatingModel? rating,
      DimensionModel? dimensions,
      @JsonKey(includeFromJson: false, includeToJson: false)
      ReviewModel? review}) = _$ProductModelImpl;
  _ProductModel._() : super._();

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  String get nameEn;
  set nameEn(String value);
  @override
  String get nameAr;
  set nameAr(String value);
  @override
  String get descriptionEn;
  set descriptionEn(String value);
  @override
  String get descriptionAr;
  set descriptionAr(String value);
  @override
  double get basePrice;
  set basePrice(double value);
  @override
  double get discountPrice;
  set discountPrice(double value);
  @override
  int get basketQuantity;
  set basketQuantity(int value);
  @override
  int get stockQuantity;
  set stockQuantity(int value);
  @override
  String get thumbnail;
  set thumbnail(String value);
  @override
  String get categoryId;
  set categoryId(String value);
  @override
  bool get inStock;
  set inStock(bool value);
  @override
  bool get published;
  set published(bool value);
  @override
  bool get featured;
  set featured(bool value);
  @override
  List<MealOptionModel> get items;
  set items(List<MealOptionModel> value);
  @override
  List<ColorOption> get colors;
  set colors(List<ColorOption> value);
  @override
  List<SizeOption> get sizes;
  set sizes(List<SizeOption> value);
  @override
  List<String> get images;
  set images(List<String> value);
  @override
  List<String> get tags;
  set tags(List<String> value);
  @override
  List<String> get categoryIds;
  set categoryIds(List<String> value);
  @override
  String? get note;
  set note(String? value);
  @override
  String? get selectedColorId;
  set selectedColorId(String? value);
  @override
  String? get selectedSizeId;
  set selectedSizeId(String? value);
  @override
  RatingModel? get rating;
  set rating(RatingModel? value);
  @override
  DimensionModel? get dimensions;
  set dimensions(DimensionModel? value);
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  ReviewModel? get review;
  @JsonKey(includeFromJson: false, includeToJson: false)
  set review(ReviewModel? value);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MealOptionModel _$MealOptionModelFromJson(Map<String, dynamic> json) {
  return _MealOptionModel.fromJson(json);
}

/// @nodoc
mixin _$MealOptionModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  set nameEn(String value) => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  set nameAr(String value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;
  String? get selectedId => throw _privateConstructorUsedError;
  set selectedId(String? value) => throw _privateConstructorUsedError;
  List<String> get selectedIds => throw _privateConstructorUsedError;
  set selectedIds(List<String> value) => throw _privateConstructorUsedError;
  List<OptionItemModel> get items => throw _privateConstructorUsedError;
  set items(List<OptionItemModel> value) => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  Object? get globalKey => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set globalKey(Object? value) => throw _privateConstructorUsedError;

  /// Serializes this MealOptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealOptionModelCopyWith<MealOptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealOptionModelCopyWith<$Res> {
  factory $MealOptionModelCopyWith(
          MealOptionModel value, $Res Function(MealOptionModel) then) =
      _$MealOptionModelCopyWithImpl<$Res, MealOptionModel>;
  @useResult
  $Res call(
      {String id,
      String nameEn,
      String nameAr,
      String type,
      String? selectedId,
      List<String> selectedIds,
      List<OptionItemModel> items,
      @JsonKey(includeToJson: false, includeFromJson: false)
      Object? globalKey});
}

/// @nodoc
class _$MealOptionModelCopyWithImpl<$Res, $Val extends MealOptionModel>
    implements $MealOptionModelCopyWith<$Res> {
  _$MealOptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? type = null,
    Object? selectedId = freezed,
    Object? selectedIds = null,
    Object? items = null,
    Object? globalKey = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      selectedId: freezed == selectedId
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedIds: null == selectedIds
          ? _value.selectedIds
          : selectedIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OptionItemModel>,
      globalKey: freezed == globalKey ? _value.globalKey : globalKey,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealOptionModelImplCopyWith<$Res>
    implements $MealOptionModelCopyWith<$Res> {
  factory _$$MealOptionModelImplCopyWith(_$MealOptionModelImpl value,
          $Res Function(_$MealOptionModelImpl) then) =
      __$$MealOptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nameEn,
      String nameAr,
      String type,
      String? selectedId,
      List<String> selectedIds,
      List<OptionItemModel> items,
      @JsonKey(includeToJson: false, includeFromJson: false)
      Object? globalKey});
}

/// @nodoc
class __$$MealOptionModelImplCopyWithImpl<$Res>
    extends _$MealOptionModelCopyWithImpl<$Res, _$MealOptionModelImpl>
    implements _$$MealOptionModelImplCopyWith<$Res> {
  __$$MealOptionModelImplCopyWithImpl(
      _$MealOptionModelImpl _value, $Res Function(_$MealOptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? type = null,
    Object? selectedId = freezed,
    Object? selectedIds = null,
    Object? items = null,
    Object? globalKey = freezed,
  }) {
    return _then(_$MealOptionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      selectedId: freezed == selectedId
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedIds: null == selectedIds
          ? _value.selectedIds
          : selectedIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OptionItemModel>,
      globalKey: freezed == globalKey ? _value.globalKey : globalKey,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealOptionModelImpl extends _MealOptionModel {
  _$MealOptionModelImpl(
      {this.id = '',
      this.nameEn = '',
      this.nameAr = '',
      this.type = '',
      this.selectedId,
      this.selectedIds = const [],
      this.items = const [],
      @JsonKey(includeToJson: false, includeFromJson: false) this.globalKey})
      : super._();

  factory _$MealOptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealOptionModelImplFromJson(json);

  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String nameEn;
  @override
  @JsonKey()
  String nameAr;
  @override
  @JsonKey()
  String type;
  @override
  String? selectedId;
  @override
  @JsonKey()
  List<String> selectedIds;
  @override
  @JsonKey()
  List<OptionItemModel> items;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  Object? globalKey;

  @override
  String toString() {
    return 'MealOptionModel(id: $id, nameEn: $nameEn, nameAr: $nameAr, type: $type, selectedId: $selectedId, selectedIds: $selectedIds, items: $items, globalKey: $globalKey)';
  }

  /// Create a copy of MealOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealOptionModelImplCopyWith<_$MealOptionModelImpl> get copyWith =>
      __$$MealOptionModelImplCopyWithImpl<_$MealOptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealOptionModelImplToJson(
      this,
    );
  }
}

abstract class _MealOptionModel extends MealOptionModel {
  factory _MealOptionModel(
      {String id,
      String nameEn,
      String nameAr,
      String type,
      String? selectedId,
      List<String> selectedIds,
      List<OptionItemModel> items,
      @JsonKey(includeToJson: false, includeFromJson: false)
      Object? globalKey}) = _$MealOptionModelImpl;
  _MealOptionModel._() : super._();

  factory _MealOptionModel.fromJson(Map<String, dynamic> json) =
      _$MealOptionModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get nameEn;
  set nameEn(String value);
  @override
  String get nameAr;
  set nameAr(String value);
  @override
  String get type;
  set type(String value);
  @override
  String? get selectedId;
  set selectedId(String? value);
  @override
  List<String> get selectedIds;
  set selectedIds(List<String> value);
  @override
  List<OptionItemModel> get items;
  set items(List<OptionItemModel> value);
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  Object? get globalKey;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set globalKey(Object? value);

  /// Create a copy of MealOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealOptionModelImplCopyWith<_$MealOptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OptionItemModel _$OptionItemModelFromJson(Map<String, dynamic> json) {
  return _OptionItemModel.fromJson(json);
}

/// @nodoc
mixin _$OptionItemModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  set nameEn(String value) => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  set nameAr(String value) => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  set price(double value) => throw _privateConstructorUsedError;

  /// Serializes this OptionItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OptionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionItemModelCopyWith<OptionItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionItemModelCopyWith<$Res> {
  factory $OptionItemModelCopyWith(
          OptionItemModel value, $Res Function(OptionItemModel) then) =
      _$OptionItemModelCopyWithImpl<$Res, OptionItemModel>;
  @useResult
  $Res call({String id, String nameEn, String nameAr, double price});
}

/// @nodoc
class _$OptionItemModelCopyWithImpl<$Res, $Val extends OptionItemModel>
    implements $OptionItemModelCopyWith<$Res> {
  _$OptionItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OptionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionItemModelImplCopyWith<$Res>
    implements $OptionItemModelCopyWith<$Res> {
  factory _$$OptionItemModelImplCopyWith(_$OptionItemModelImpl value,
          $Res Function(_$OptionItemModelImpl) then) =
      __$$OptionItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nameEn, String nameAr, double price});
}

/// @nodoc
class __$$OptionItemModelImplCopyWithImpl<$Res>
    extends _$OptionItemModelCopyWithImpl<$Res, _$OptionItemModelImpl>
    implements _$$OptionItemModelImplCopyWith<$Res> {
  __$$OptionItemModelImplCopyWithImpl(
      _$OptionItemModelImpl _value, $Res Function(_$OptionItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OptionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? price = null,
  }) {
    return _then(_$OptionItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionItemModelImpl extends _OptionItemModel {
  _$OptionItemModelImpl(
      {this.id = '', this.nameEn = '', this.nameAr = '', this.price = 0.0})
      : super._();

  factory _$OptionItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionItemModelImplFromJson(json);

  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String nameEn;
  @override
  @JsonKey()
  String nameAr;
  @override
  @JsonKey()
  double price;

  @override
  String toString() {
    return 'OptionItemModel(id: $id, nameEn: $nameEn, nameAr: $nameAr, price: $price)';
  }

  /// Create a copy of OptionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionItemModelImplCopyWith<_$OptionItemModelImpl> get copyWith =>
      __$$OptionItemModelImplCopyWithImpl<_$OptionItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionItemModelImplToJson(
      this,
    );
  }
}

abstract class _OptionItemModel extends OptionItemModel {
  factory _OptionItemModel(
      {String id,
      String nameEn,
      String nameAr,
      double price}) = _$OptionItemModelImpl;
  _OptionItemModel._() : super._();

  factory _OptionItemModel.fromJson(Map<String, dynamic> json) =
      _$OptionItemModelImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get nameEn;
  set nameEn(String value);
  @override
  String get nameAr;
  set nameAr(String value);
  @override
  double get price;
  set price(double value);

  /// Create a copy of OptionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionItemModelImplCopyWith<_$OptionItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryFeeModel _$DeliveryFeeModelFromJson(Map<String, dynamic> json) {
  return _DeliveryFeeModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryFeeModel {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  double? get fee => throw _privateConstructorUsedError;
  set fee(double? value) => throw _privateConstructorUsedError;
  double? get distanceRange => throw _privateConstructorUsedError;
  set distanceRange(double? value) => throw _privateConstructorUsedError;

  /// Serializes this DeliveryFeeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryFeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryFeeModelCopyWith<DeliveryFeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryFeeModelCopyWith<$Res> {
  factory $DeliveryFeeModelCopyWith(
          DeliveryFeeModel value, $Res Function(DeliveryFeeModel) then) =
      _$DeliveryFeeModelCopyWithImpl<$Res, DeliveryFeeModel>;
  @useResult
  $Res call({String? id, double? fee, double? distanceRange});
}

/// @nodoc
class _$DeliveryFeeModelCopyWithImpl<$Res, $Val extends DeliveryFeeModel>
    implements $DeliveryFeeModelCopyWith<$Res> {
  _$DeliveryFeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryFeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fee = freezed,
    Object? distanceRange = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceRange: freezed == distanceRange
          ? _value.distanceRange
          : distanceRange // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryFeeModelImplCopyWith<$Res>
    implements $DeliveryFeeModelCopyWith<$Res> {
  factory _$$DeliveryFeeModelImplCopyWith(_$DeliveryFeeModelImpl value,
          $Res Function(_$DeliveryFeeModelImpl) then) =
      __$$DeliveryFeeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, double? fee, double? distanceRange});
}

/// @nodoc
class __$$DeliveryFeeModelImplCopyWithImpl<$Res>
    extends _$DeliveryFeeModelCopyWithImpl<$Res, _$DeliveryFeeModelImpl>
    implements _$$DeliveryFeeModelImplCopyWith<$Res> {
  __$$DeliveryFeeModelImplCopyWithImpl(_$DeliveryFeeModelImpl _value,
      $Res Function(_$DeliveryFeeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryFeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fee = freezed,
    Object? distanceRange = freezed,
  }) {
    return _then(_$DeliveryFeeModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceRange: freezed == distanceRange
          ? _value.distanceRange
          : distanceRange // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryFeeModelImpl implements _DeliveryFeeModel {
  _$DeliveryFeeModelImpl({this.id, this.fee, this.distanceRange});

  factory _$DeliveryFeeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryFeeModelImplFromJson(json);

  @override
  String? id;
  @override
  double? fee;
  @override
  double? distanceRange;

  @override
  String toString() {
    return 'DeliveryFeeModel(id: $id, fee: $fee, distanceRange: $distanceRange)';
  }

  /// Create a copy of DeliveryFeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryFeeModelImplCopyWith<_$DeliveryFeeModelImpl> get copyWith =>
      __$$DeliveryFeeModelImplCopyWithImpl<_$DeliveryFeeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryFeeModelImplToJson(
      this,
    );
  }
}

abstract class _DeliveryFeeModel implements DeliveryFeeModel {
  factory _DeliveryFeeModel({String? id, double? fee, double? distanceRange}) =
      _$DeliveryFeeModelImpl;

  factory _DeliveryFeeModel.fromJson(Map<String, dynamic> json) =
      _$DeliveryFeeModelImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  double? get fee;
  set fee(double? value);
  @override
  double? get distanceRange;
  set distanceRange(double? value);

  /// Create a copy of DeliveryFeeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryFeeModelImplCopyWith<_$DeliveryFeeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ColorOption _$ColorOptionFromJson(Map<String, dynamic> json) {
  return _ColorOption.fromJson(json);
}

/// @nodoc
mixin _$ColorOption {
  String get id => throw _privateConstructorUsedError;
  String get hex => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError; // optional override
  double get discountPrice => throw _privateConstructorUsedError;
  int get stockQuantity => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  List<String> get sizeIds => throw _privateConstructorUsedError;

  /// Serializes this ColorOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ColorOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorOptionCopyWith<ColorOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorOptionCopyWith<$Res> {
  factory $ColorOptionCopyWith(
          ColorOption value, $Res Function(ColorOption) then) =
      _$ColorOptionCopyWithImpl<$Res, ColorOption>;
  @useResult
  $Res call(
      {String id,
      String hex,
      String name,
      List<String> images,
      double price,
      double discountPrice,
      int stockQuantity,
      bool active,
      List<String> sizeIds});
}

/// @nodoc
class _$ColorOptionCopyWithImpl<$Res, $Val extends ColorOption>
    implements $ColorOptionCopyWith<$Res> {
  _$ColorOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hex = null,
    Object? name = null,
    Object? images = null,
    Object? price = null,
    Object? discountPrice = null,
    Object? stockQuantity = null,
    Object? active = null,
    Object? sizeIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hex: null == hex
          ? _value.hex
          : hex // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      sizeIds: null == sizeIds
          ? _value.sizeIds
          : sizeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorOptionImplCopyWith<$Res>
    implements $ColorOptionCopyWith<$Res> {
  factory _$$ColorOptionImplCopyWith(
          _$ColorOptionImpl value, $Res Function(_$ColorOptionImpl) then) =
      __$$ColorOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String hex,
      String name,
      List<String> images,
      double price,
      double discountPrice,
      int stockQuantity,
      bool active,
      List<String> sizeIds});
}

/// @nodoc
class __$$ColorOptionImplCopyWithImpl<$Res>
    extends _$ColorOptionCopyWithImpl<$Res, _$ColorOptionImpl>
    implements _$$ColorOptionImplCopyWith<$Res> {
  __$$ColorOptionImplCopyWithImpl(
      _$ColorOptionImpl _value, $Res Function(_$ColorOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hex = null,
    Object? name = null,
    Object? images = null,
    Object? price = null,
    Object? discountPrice = null,
    Object? stockQuantity = null,
    Object? active = null,
    Object? sizeIds = null,
  }) {
    return _then(_$ColorOptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hex: null == hex
          ? _value.hex
          : hex // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      sizeIds: null == sizeIds
          ? _value._sizeIds
          : sizeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorOptionImpl implements _ColorOption {
  _$ColorOptionImpl(
      {this.id = '',
      this.hex = '',
      this.name = '',
      final List<String> images = const [],
      this.price = 0.0,
      this.discountPrice = 0.0,
      this.stockQuantity = 0,
      this.active = true,
      final List<String> sizeIds = const []})
      : _images = images,
        _sizeIds = sizeIds;

  factory _$ColorOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorOptionImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String hex;
  @override
  @JsonKey()
  final String name;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final double price;
// optional override
  @override
  @JsonKey()
  final double discountPrice;
  @override
  @JsonKey()
  final int stockQuantity;
  @override
  @JsonKey()
  final bool active;
  final List<String> _sizeIds;
  @override
  @JsonKey()
  List<String> get sizeIds {
    if (_sizeIds is EqualUnmodifiableListView) return _sizeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sizeIds);
  }

  @override
  String toString() {
    return 'ColorOption(id: $id, hex: $hex, name: $name, images: $images, price: $price, discountPrice: $discountPrice, stockQuantity: $stockQuantity, active: $active, sizeIds: $sizeIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hex, hex) || other.hex == hex) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality().equals(other._sizeIds, _sizeIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      hex,
      name,
      const DeepCollectionEquality().hash(_images),
      price,
      discountPrice,
      stockQuantity,
      active,
      const DeepCollectionEquality().hash(_sizeIds));

  /// Create a copy of ColorOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorOptionImplCopyWith<_$ColorOptionImpl> get copyWith =>
      __$$ColorOptionImplCopyWithImpl<_$ColorOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorOptionImplToJson(
      this,
    );
  }
}

abstract class _ColorOption implements ColorOption {
  factory _ColorOption(
      {final String id,
      final String hex,
      final String name,
      final List<String> images,
      final double price,
      final double discountPrice,
      final int stockQuantity,
      final bool active,
      final List<String> sizeIds}) = _$ColorOptionImpl;

  factory _ColorOption.fromJson(Map<String, dynamic> json) =
      _$ColorOptionImpl.fromJson;

  @override
  String get id;
  @override
  String get hex;
  @override
  String get name;
  @override
  List<String> get images;
  @override
  double get price; // optional override
  @override
  double get discountPrice;
  @override
  int get stockQuantity;
  @override
  bool get active;
  @override
  List<String> get sizeIds;

  /// Create a copy of ColorOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorOptionImplCopyWith<_$ColorOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SizeOption _$SizeOptionFromJson(Map<String, dynamic> json) {
  return _SizeOption.fromJson(json);
}

/// @nodoc
mixin _$SizeOption {
  String get id => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get discountPrice => throw _privateConstructorUsedError;
  int get stockQuantity => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this SizeOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SizeOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SizeOptionCopyWith<SizeOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SizeOptionCopyWith<$Res> {
  factory $SizeOptionCopyWith(
          SizeOption value, $Res Function(SizeOption) then) =
      _$SizeOptionCopyWithImpl<$Res, SizeOption>;
  @useResult
  $Res call(
      {String id,
      String size,
      double price,
      double discountPrice,
      int stockQuantity,
      bool active});
}

/// @nodoc
class _$SizeOptionCopyWithImpl<$Res, $Val extends SizeOption>
    implements $SizeOptionCopyWith<$Res> {
  _$SizeOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SizeOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? size = null,
    Object? price = null,
    Object? discountPrice = null,
    Object? stockQuantity = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SizeOptionImplCopyWith<$Res>
    implements $SizeOptionCopyWith<$Res> {
  factory _$$SizeOptionImplCopyWith(
          _$SizeOptionImpl value, $Res Function(_$SizeOptionImpl) then) =
      __$$SizeOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String size,
      double price,
      double discountPrice,
      int stockQuantity,
      bool active});
}

/// @nodoc
class __$$SizeOptionImplCopyWithImpl<$Res>
    extends _$SizeOptionCopyWithImpl<$Res, _$SizeOptionImpl>
    implements _$$SizeOptionImplCopyWith<$Res> {
  __$$SizeOptionImplCopyWithImpl(
      _$SizeOptionImpl _value, $Res Function(_$SizeOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SizeOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? size = null,
    Object? price = null,
    Object? discountPrice = null,
    Object? stockQuantity = null,
    Object? active = null,
  }) {
    return _then(_$SizeOptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SizeOptionImpl implements _SizeOption {
  _$SizeOptionImpl(
      {this.id = '',
      this.size = '',
      this.price = 0.0,
      this.discountPrice = 0.0,
      this.stockQuantity = 0,
      this.active = true});

  factory _$SizeOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SizeOptionImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String size;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final double discountPrice;
  @override
  @JsonKey()
  final int stockQuantity;
  @override
  @JsonKey()
  final bool active;

  @override
  String toString() {
    return 'SizeOption(id: $id, size: $size, price: $price, discountPrice: $discountPrice, stockQuantity: $stockQuantity, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SizeOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, size, price, discountPrice, stockQuantity, active);

  /// Create a copy of SizeOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SizeOptionImplCopyWith<_$SizeOptionImpl> get copyWith =>
      __$$SizeOptionImplCopyWithImpl<_$SizeOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SizeOptionImplToJson(
      this,
    );
  }
}

abstract class _SizeOption implements SizeOption {
  factory _SizeOption(
      {final String id,
      final String size,
      final double price,
      final double discountPrice,
      final int stockQuantity,
      final bool active}) = _$SizeOptionImpl;

  factory _SizeOption.fromJson(Map<String, dynamic> json) =
      _$SizeOptionImpl.fromJson;

  @override
  String get id;
  @override
  String get size;
  @override
  double get price;
  @override
  double get discountPrice;
  @override
  int get stockQuantity;
  @override
  bool get active;

  /// Create a copy of SizeOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SizeOptionImplCopyWith<_$SizeOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DimensionModel _$DimensionModelFromJson(Map<String, dynamic> json) {
  return _DimensionModel.fromJson(json);
}

/// @nodoc
mixin _$DimensionModel {
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  double get depth => throw _privateConstructorUsedError;

  /// Serializes this DimensionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DimensionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DimensionModelCopyWith<DimensionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DimensionModelCopyWith<$Res> {
  factory $DimensionModelCopyWith(
          DimensionModel value, $Res Function(DimensionModel) then) =
      _$DimensionModelCopyWithImpl<$Res, DimensionModel>;
  @useResult
  $Res call({double width, double height, double depth});
}

/// @nodoc
class _$DimensionModelCopyWithImpl<$Res, $Val extends DimensionModel>
    implements $DimensionModelCopyWith<$Res> {
  _$DimensionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DimensionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? depth = null,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DimensionModelImplCopyWith<$Res>
    implements $DimensionModelCopyWith<$Res> {
  factory _$$DimensionModelImplCopyWith(_$DimensionModelImpl value,
          $Res Function(_$DimensionModelImpl) then) =
      __$$DimensionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double width, double height, double depth});
}

/// @nodoc
class __$$DimensionModelImplCopyWithImpl<$Res>
    extends _$DimensionModelCopyWithImpl<$Res, _$DimensionModelImpl>
    implements _$$DimensionModelImplCopyWith<$Res> {
  __$$DimensionModelImplCopyWithImpl(
      _$DimensionModelImpl _value, $Res Function(_$DimensionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DimensionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? depth = null,
  }) {
    return _then(_$DimensionModelImpl(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DimensionModelImpl implements _DimensionModel {
  _$DimensionModelImpl({this.width = 0.0, this.height = 0.0, this.depth = 0.0});

  factory _$DimensionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DimensionModelImplFromJson(json);

  @override
  @JsonKey()
  final double width;
  @override
  @JsonKey()
  final double height;
  @override
  @JsonKey()
  final double depth;

  @override
  String toString() {
    return 'DimensionModel(width: $width, height: $height, depth: $depth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DimensionModelImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.depth, depth) || other.depth == depth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height, depth);

  /// Create a copy of DimensionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DimensionModelImplCopyWith<_$DimensionModelImpl> get copyWith =>
      __$$DimensionModelImplCopyWithImpl<_$DimensionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DimensionModelImplToJson(
      this,
    );
  }
}

abstract class _DimensionModel implements DimensionModel {
  factory _DimensionModel(
      {final double width,
      final double height,
      final double depth}) = _$DimensionModelImpl;

  factory _DimensionModel.fromJson(Map<String, dynamic> json) =
      _$DimensionModelImpl.fromJson;

  @override
  double get width;
  @override
  double get height;
  @override
  double get depth;

  /// Create a copy of DimensionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DimensionModelImplCopyWith<_$DimensionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) {
  return _RatingModel.fromJson(json);
}

/// @nodoc
mixin _$RatingModel {
  int get count => throw _privateConstructorUsedError;
  double get average => throw _privateConstructorUsedError;

  /// Serializes this RatingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingModelCopyWith<RatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingModelCopyWith<$Res> {
  factory $RatingModelCopyWith(
          RatingModel value, $Res Function(RatingModel) then) =
      _$RatingModelCopyWithImpl<$Res, RatingModel>;
  @useResult
  $Res call({int count, double average});
}

/// @nodoc
class _$RatingModelCopyWithImpl<$Res, $Val extends RatingModel>
    implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? average = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingModelImplCopyWith<$Res>
    implements $RatingModelCopyWith<$Res> {
  factory _$$RatingModelImplCopyWith(
          _$RatingModelImpl value, $Res Function(_$RatingModelImpl) then) =
      __$$RatingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, double average});
}

/// @nodoc
class __$$RatingModelImplCopyWithImpl<$Res>
    extends _$RatingModelCopyWithImpl<$Res, _$RatingModelImpl>
    implements _$$RatingModelImplCopyWith<$Res> {
  __$$RatingModelImplCopyWithImpl(
      _$RatingModelImpl _value, $Res Function(_$RatingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? average = null,
  }) {
    return _then(_$RatingModelImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingModelImpl implements _RatingModel {
  _$RatingModelImpl({this.count = 0, this.average = 0.0});

  factory _$RatingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingModelImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final double average;

  @override
  String toString() {
    return 'RatingModel(count: $count, average: $average)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingModelImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.average, average) || other.average == average));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, average);

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingModelImplCopyWith<_$RatingModelImpl> get copyWith =>
      __$$RatingModelImplCopyWithImpl<_$RatingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingModelImplToJson(
      this,
    );
  }
}

abstract class _RatingModel implements RatingModel {
  factory _RatingModel({final int count, final double average}) =
      _$RatingModelImpl;

  factory _RatingModel.fromJson(Map<String, dynamic> json) =
      _$RatingModelImpl.fromJson;

  @override
  int get count;
  @override
  double get average;

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingModelImplCopyWith<_$RatingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
