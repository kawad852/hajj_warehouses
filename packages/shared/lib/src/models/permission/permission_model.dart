import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_model.freezed.dart';
part 'permission_model.g.dart';

@unfreezed
class PermissionModel with _$PermissionModel {
  factory PermissionModel({
    String? id,
    String? path,
    @Default(false) bool add,
    @Default(false) bool edit,
    @Default(false) bool show,
    @Default(false) bool delete,
  }) = _PermissionModel;

  factory PermissionModel.fromJson(Map<String, dynamic> json) => _$PermissionModelFromJson(json);
}
