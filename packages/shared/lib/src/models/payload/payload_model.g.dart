// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PayloadModelImpl _$$PayloadModelImplFromJson(Map<String, dynamic> json) =>
    _$PayloadModelImpl(
      aps:
          json['aps'] == null
              ? null
              : ApsModel.fromJson(json['aps'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PayloadModelImplToJson(_$PayloadModelImpl instance) =>
    <String, dynamic>{'aps': instance.aps};
