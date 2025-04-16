// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromoCodeModelImpl _$$PromoCodeModelImplFromJson(Map<String, dynamic> json) =>
    _$PromoCodeModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      expiryDate: const TimestampSerializer().fromJson(json['expiryDate']),
      id: json['id'] as String?,
      code: json['code'] as String?,
      percent: (json['percent'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      active: json['active'] as bool? ?? true,
    );

Map<String, dynamic> _$$PromoCodeModelImplToJson(
  _$PromoCodeModelImpl instance,
) => <String, dynamic>{
  'createdAt': const TimestampSerializer().toJson(instance.createdAt),
  'expiryDate': const TimestampSerializer().toJson(instance.expiryDate),
  'id': instance.id,
  'code': instance.code,
  'percent': instance.percent,
  'amount': instance.amount,
  'active': instance.active,
};
