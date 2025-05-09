// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionModelImpl _$$PermissionModelImplFromJson(
  Map<String, dynamic> json,
) => _$PermissionModelImpl(
  id: json['id'] as String?,
  path: json['path'] as String?,
  add: json['add'] as bool? ?? false,
  edit: json['edit'] as bool? ?? false,
  show: json['show'] as bool? ?? false,
  delete: json['delete'] as bool? ?? false,
);

Map<String, dynamic> _$$PermissionModelImplToJson(
  _$PermissionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'path': instance.path,
  'add': instance.add,
  'edit': instance.edit,
  'show': instance.show,
  'delete': instance.delete,
};
