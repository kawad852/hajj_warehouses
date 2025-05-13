import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@unfreezed
class RoleModel with _$RoleModel {
  @JsonSerializable(explicitToJson: true)
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

  RoleModel._();

  String get name {
    return UiHelper.translate(textEN: nameEn, textAR: nameAr);
  }
}
