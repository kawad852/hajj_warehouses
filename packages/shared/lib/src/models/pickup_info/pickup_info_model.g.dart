// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PickUpInfoModelImpl _$$PickUpInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PickUpInfoModelImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneCountryCode: json['phoneCountryCode'] as String?,
      phoneNum: json['phoneNum'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PickUpInfoModelImplToJson(
        _$PickUpInfoModelImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneCountryCode': instance.phoneCountryCode,
      'phoneNum': instance.phoneNum,
      'lat': instance.lat,
      'lng': instance.lng,
    };
