import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import '../pickup_info/pickup_info_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@unfreezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? displayName,
    String? email,
    String? deviceToken,
    LightBranchModel? branch,
    String? role,
    String? username,
    String? languageCode,
    @Default(false) bool blocked,
    AddressModel? deliveryAddress,
    PickUpInfoModel? pickupInfo,
    String? phoneCountryCode,
    String? phoneNum,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class LightUserModel with _$LightUserModel {
  factory LightUserModel({String? id, String? displayName}) = _LightUserModel;

  factory LightUserModel.fromJson(Map<String, dynamic> json) => _$LightUserModelFromJson(json);
}
