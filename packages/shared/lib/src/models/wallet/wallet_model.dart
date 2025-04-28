import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@unfreezed
class WalletModel with _$WalletModel {
  @JsonSerializable(explicitToJson: true)
  factory WalletModel({
    @TimestampSerializer() required DateTime createdAt,
    required String id,
    required String branchId,
    required String transactionType,
    String? addReason,
    String? notes,
    required double amount,
    required String operationId,
    required LightUserModel user,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);
}
