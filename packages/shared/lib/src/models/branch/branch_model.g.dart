// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchModelImpl _$$BranchModelImplFromJson(Map<String, dynamic> json) =>
    _$BranchModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$BranchModelImplToJson(_$BranchModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'name': instance.name,
    };

_$LightBranchModelImpl _$$LightBranchModelImplFromJson(
  Map<String, dynamic> json,
) => _$LightBranchModelImpl(
  id: json['id'] as String?,
  name: json['name'] as String? ?? '',
  balanceAmount: (json['balanceAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$$LightBranchModelImplToJson(
  _$LightBranchModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'balanceAmount': instance.balanceAmount,
};
