// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  set paymentMethod(String? value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;
  List<BasketModel>? get basket => throw _privateConstructorUsedError;
  set basket(List<BasketModel>? value) => throw _privateConstructorUsedError;
  PromoCodeModel? get promoCode => throw _privateConstructorUsedError;
  set promoCode(PromoCodeModel? value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  double? get basketTotal => throw _privateConstructorUsedError;
  set basketTotal(double? value) => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  set deliveryFee(double value) => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  set discount(double? value) => throw _privateConstructorUsedError;
  double? get orderTotal => throw _privateConstructorUsedError;
  set orderTotal(double? value) => throw _privateConstructorUsedError;
  bool get reviewed => throw _privateConstructorUsedError;
  set reviewed(bool value) => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  set user(UserModel? value) => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
    OrderModel value,
    $Res Function(OrderModel) then,
  ) = _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? paymentMethod,
    String type,
    List<BasketModel>? basket,
    PromoCodeModel? promoCode,
    String status,
    double? basketTotal,
    double deliveryFee,
    double? discount,
    double? orderTotal,
    bool reviewed,
    UserModel? user,
  });

  $PromoCodeModelCopyWith<$Res>? get promoCode;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? paymentMethod = freezed,
    Object? type = null,
    Object? basket = freezed,
    Object? promoCode = freezed,
    Object? status = null,
    Object? basketTotal = freezed,
    Object? deliveryFee = null,
    Object? discount = freezed,
    Object? orderTotal = freezed,
    Object? reviewed = null,
    Object? user = freezed,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String?,
            paymentMethod:
                freezed == paymentMethod
                    ? _value.paymentMethod
                    : paymentMethod // ignore: cast_nullable_to_non_nullable
                        as String?,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
            basket:
                freezed == basket
                    ? _value.basket
                    : basket // ignore: cast_nullable_to_non_nullable
                        as List<BasketModel>?,
            promoCode:
                freezed == promoCode
                    ? _value.promoCode
                    : promoCode // ignore: cast_nullable_to_non_nullable
                        as PromoCodeModel?,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            basketTotal:
                freezed == basketTotal
                    ? _value.basketTotal
                    : basketTotal // ignore: cast_nullable_to_non_nullable
                        as double?,
            deliveryFee:
                null == deliveryFee
                    ? _value.deliveryFee
                    : deliveryFee // ignore: cast_nullable_to_non_nullable
                        as double,
            discount:
                freezed == discount
                    ? _value.discount
                    : discount // ignore: cast_nullable_to_non_nullable
                        as double?,
            orderTotal:
                freezed == orderTotal
                    ? _value.orderTotal
                    : orderTotal // ignore: cast_nullable_to_non_nullable
                        as double?,
            reviewed:
                null == reviewed
                    ? _value.reviewed
                    : reviewed // ignore: cast_nullable_to_non_nullable
                        as bool,
            user:
                freezed == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as UserModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromoCodeModelCopyWith<$Res>? get promoCode {
    if (_value.promoCode == null) {
      return null;
    }

    return $PromoCodeModelCopyWith<$Res>(_value.promoCode!, (value) {
      return _then(_value.copyWith(promoCode: value) as $Val);
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
    _$OrderModelImpl value,
    $Res Function(_$OrderModelImpl) then,
  ) = __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? paymentMethod,
    String type,
    List<BasketModel>? basket,
    PromoCodeModel? promoCode,
    String status,
    double? basketTotal,
    double deliveryFee,
    double? discount,
    double? orderTotal,
    bool reviewed,
    UserModel? user,
  });

  @override
  $PromoCodeModelCopyWith<$Res>? get promoCode;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
    _$OrderModelImpl _value,
    $Res Function(_$OrderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? paymentMethod = freezed,
    Object? type = null,
    Object? basket = freezed,
    Object? promoCode = freezed,
    Object? status = null,
    Object? basketTotal = freezed,
    Object? deliveryFee = null,
    Object? discount = freezed,
    Object? orderTotal = freezed,
    Object? reviewed = null,
    Object? user = freezed,
  }) {
    return _then(
      _$OrderModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String?,
        paymentMethod:
            freezed == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                    as String?,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        basket:
            freezed == basket
                ? _value.basket
                : basket // ignore: cast_nullable_to_non_nullable
                    as List<BasketModel>?,
        promoCode:
            freezed == promoCode
                ? _value.promoCode
                : promoCode // ignore: cast_nullable_to_non_nullable
                    as PromoCodeModel?,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        basketTotal:
            freezed == basketTotal
                ? _value.basketTotal
                : basketTotal // ignore: cast_nullable_to_non_nullable
                    as double?,
        deliveryFee:
            null == deliveryFee
                ? _value.deliveryFee
                : deliveryFee // ignore: cast_nullable_to_non_nullable
                    as double,
        discount:
            freezed == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                    as double?,
        orderTotal:
            freezed == orderTotal
                ? _value.orderTotal
                : orderTotal // ignore: cast_nullable_to_non_nullable
                    as double?,
        reviewed:
            null == reviewed
                ? _value.reviewed
                : reviewed // ignore: cast_nullable_to_non_nullable
                    as bool,
        user:
            freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as UserModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  _$OrderModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id,
    this.paymentMethod,
    this.type = "DELIVERY",
    this.basket,
    this.promoCode,
    this.status = "PLACED",
    this.basketTotal,
    this.deliveryFee = 0.0,
    this.discount,
    this.orderTotal,
    this.reviewed = false,
    this.user,
  });

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  String? id;
  @override
  String? paymentMethod;
  @override
  @JsonKey()
  String type;
  @override
  List<BasketModel>? basket;
  @override
  PromoCodeModel? promoCode;
  @override
  @JsonKey()
  String status;
  @override
  double? basketTotal;
  @override
  @JsonKey()
  double deliveryFee;
  @override
  double? discount;
  @override
  double? orderTotal;
  @override
  @JsonKey()
  bool reviewed;
  @override
  UserModel? user;

  @override
  String toString() {
    return 'OrderModel(createdAt: $createdAt, id: $id, paymentMethod: $paymentMethod, type: $type, basket: $basket, promoCode: $promoCode, status: $status, basketTotal: $basketTotal, deliveryFee: $deliveryFee, discount: $discount, orderTotal: $orderTotal, reviewed: $reviewed, user: $user)';
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(this);
  }
}

abstract class _OrderModel implements OrderModel {
  factory _OrderModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? paymentMethod,
    String type,
    List<BasketModel>? basket,
    PromoCodeModel? promoCode,
    String status,
    double? basketTotal,
    double deliveryFee,
    double? discount,
    double? orderTotal,
    bool reviewed,
    UserModel? user,
  }) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String? get id;
  set id(String? value);
  @override
  String? get paymentMethod;
  set paymentMethod(String? value);
  @override
  String get type;
  set type(String value);
  @override
  List<BasketModel>? get basket;
  set basket(List<BasketModel>? value);
  @override
  PromoCodeModel? get promoCode;
  set promoCode(PromoCodeModel? value);
  @override
  String get status;
  set status(String value);
  @override
  double? get basketTotal;
  set basketTotal(double? value);
  @override
  double get deliveryFee;
  set deliveryFee(double value);
  @override
  double? get discount;
  set discount(double? value);
  @override
  double? get orderTotal;
  set orderTotal(double? value);
  @override
  bool get reviewed;
  set reviewed(bool value);
  @override
  UserModel? get user;
  set user(UserModel? value);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
