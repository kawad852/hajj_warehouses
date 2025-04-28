// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
  Map<String, dynamic> json,
) => _$TransactionModelImpl(
  createdAt: DateTime.parse(json['createdAt'] as String),
  id: json['id'] as String,
  branchId: json['branchId'] as String,
  transactionType: json['transactionType'] as String,
  addReason: json['addReason'] as String?,
  notes: json['notes'] as String?,
  amount: (json['amount'] as num).toDouble(),
  operationId: json['operationId'] as String,
  user: LightUserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$TransactionModelImplToJson(
  _$TransactionModelImpl instance,
) => <String, dynamic>{
  'createdAt': instance.createdAt.toIso8601String(),
  'id': instance.id,
  'branchId': instance.branchId,
  'transactionType': instance.transactionType,
  'addReason': instance.addReason,
  'notes': instance.notes,
  'amount': instance.amount,
  'operationId': instance.operationId,
  'user': instance.user.toJson(),
};
