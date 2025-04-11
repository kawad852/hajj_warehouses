// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyModelImpl _$$CompanyModelImplFromJson(Map<String, dynamic> json) =>
    _$CompanyModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      name: json['name'] as String?,
      subscription: json['subscription'] == null
          ? null
          : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
      intermediaryId: json['intermediaryId'] as String?,
      serviceData: json['serviceData'] == null
          ? null
          : ServiceData.fromJson(json['serviceData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CompanyModelImplToJson(_$CompanyModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'name': instance.name,
      'subscription': instance.subscription?.toJson(),
      'intermediaryId': instance.intermediaryId,
      'serviceData': instance.serviceData?.toJson(),
    };

_$SubscriptionImpl _$$SubscriptionImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionImpl(
      id: json['id'] as String?,
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$SubscriptionImplToJson(_$SubscriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
    };

_$ServiceDataImpl _$$ServiceDataImplFromJson(Map<String, dynamic> json) =>
    _$ServiceDataImpl(
      id: json['id'] as String?,
      db: json['db'] as String?,
      login: json['login'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$ServiceDataImplToJson(_$ServiceDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'db': instance.db,
      'login': instance.login,
      'password': instance.password,
    };
