// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasketModelImpl _$$BasketModelImplFromJson(Map<String, dynamic> json) =>
    _$BasketModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
      storeId: json['storeId'] as String? ?? '',
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BasketModelImplToJson(_$BasketModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'storeId': instance.storeId,
      'product': instance.product?.toJson(),
    };
