import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';
import '../../models/permission/permission_model.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@unfreezed
class RoleModel with _$RoleModel {
  factory RoleModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? nameEn,
    String? nameAr,
    String? initialLocation,
    @Default(false) bool analytics,
    List<PermissionModel>? permissions,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);
}
