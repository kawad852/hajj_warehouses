import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared.dart';

part 'branch_model.freezed.dart';
part 'branch_model.g.dart';

@unfreezed
class BranchModel with _$BranchModel {
  @JsonSerializable(explicitToJson: true)
  factory BranchModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String name,
  }) = _BranchModel;

  factory BranchModel.fromJson(Map<String, dynamic> json) => _$BranchModelFromJson(json);
}

@unfreezed
class LightBranchModel with _$LightBranchModel {
  @JsonSerializable(explicitToJson: true)
  factory LightBranchModel({
    String? id,
    @Default('') String name,
    @Default(0.0) double balanceAmount,
  }) = _LightBranchModel;

  factory LightBranchModel.fromJson(Map<String, dynamic> json) => _$LightBranchModelFromJson(json);
}
