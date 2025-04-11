// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phoneCountryCode: json['phoneCountryCode'] as String?,
      phoneNum: json['phoneNum'] as String?,
      area: json['area'] as String?,
      streetName: json['streetName'] as String?,
      buildingNum: (json['buildingNum'] as num?)?.toInt(),
      aptNum: (json['aptNum'] as num?)?.toInt(),
      floorNum: (json['floorNum'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      buildingType: json['buildingType'] as String? ?? "HOUSE",
      additionalDirections: json['additionalDirections'] as String?,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneCountryCode': instance.phoneCountryCode,
      'phoneNum': instance.phoneNum,
      'area': instance.area,
      'streetName': instance.streetName,
      'buildingNum': instance.buildingNum,
      'aptNum': instance.aptNum,
      'floorNum': instance.floorNum,
      'companyName': instance.companyName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'buildingType': instance.buildingType,
      'additionalDirections': instance.additionalDirections,
    };
