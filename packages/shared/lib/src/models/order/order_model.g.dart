// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      type: json['type'] as String? ?? "DELIVERY",
      basket: (json['basket'] as List<dynamic>?)
          ?.map((e) => BasketModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      promoCode: json['promoCode'] == null
          ? null
          : PromoCodeModel.fromJson(json['promoCode'] as Map<String, dynamic>),
      status: json['status'] as String? ?? "PLACED",
      basketTotal: (json['basketTotal'] as num?)?.toDouble(),
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble(),
      orderTotal: (json['orderTotal'] as num?)?.toDouble(),
      reviewed: json['reviewed'] as bool? ?? false,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'paymentMethod': instance.paymentMethod,
      'type': instance.type,
      'basket': instance.basket?.map((e) => e.toJson()).toList(),
      'promoCode': instance.promoCode?.toJson(),
      'status': instance.status,
      'basketTotal': instance.basketTotal,
      'deliveryFee': instance.deliveryFee,
      'discount': instance.discount,
      'orderTotal': instance.orderTotal,
      'reviewed': instance.reviewed,
      'user': instance.user?.toJson(),
    };
