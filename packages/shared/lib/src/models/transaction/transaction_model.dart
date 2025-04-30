import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@unfreezed
class TransactionModel with _$TransactionModel {
  @JsonSerializable(explicitToJson: true)
  factory TransactionModel({
    @TimestampSerializer() required DateTime createdAt,
    required String id,
    required String branchId,
    required String transactionType,
    String? depositReason,
    String? notes,
    required double amount,
    required String operationId,
    required LightUserModel user,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}
