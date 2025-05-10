// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyModelImpl _$$CompanyModelImplFromJson(Map<String, dynamic> json) =>
    _$CompanyModelImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$CompanyModelImplToJson(_$CompanyModelImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'name': instance.name,
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
