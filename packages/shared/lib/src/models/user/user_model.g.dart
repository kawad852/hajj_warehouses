// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      deviceToken: json['deviceToken'] as String?,
      role: json['role'] as String?,
      username: json['username'] as String?,
      languageCode: json['languageCode'] as String?,
      blocked: json['blocked'] as bool? ?? false,
      deliveryAddress:
          json['deliveryAddress'] == null
              ? null
              : AddressModel.fromJson(
                json['deliveryAddress'] as Map<String, dynamic>,
              ),
      pickupInfo:
          json['pickupInfo'] == null
              ? null
              : PickUpInfoModel.fromJson(
                json['pickupInfo'] as Map<String, dynamic>,
              ),
      phoneCountryCode: json['phoneCountryCode'] as String?,
      phoneNum: json['phoneNum'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'deviceToken': instance.deviceToken,
      'role': instance.role,
      'username': instance.username,
      'languageCode': instance.languageCode,
      'blocked': instance.blocked,
      'deliveryAddress': instance.deliveryAddress,
      'pickupInfo': instance.pickupInfo,
      'phoneCountryCode': instance.phoneCountryCode,
      'phoneNum': instance.phoneNum,
    };
