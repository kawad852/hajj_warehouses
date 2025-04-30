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
  depositReason: json['depositReason'] as String?,
  expenseType: json['expenseType'] as String?,
  notes: json['notes'] as String?,
  amount: (json['amount'] as num).toDouble(),
  operationId: json['operationId'] as String,
  user: LightUserModel.fromJson(json['user'] as Map<String, dynamic>),
  employee:
      json['employee'] == null
          ? null
          : LightUserModel.fromJson(json['employee'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$TransactionModelImplToJson(
  _$TransactionModelImpl instance,
) => <String, dynamic>{
  'createdAt': instance.createdAt.toIso8601String(),
  'id': instance.id,
  'branchId': instance.branchId,
  'transactionType': instance.transactionType,
  'depositReason': instance.depositReason,
  'expenseType': instance.expenseType,
  'notes': instance.notes,
  'amount': instance.amount,
  'operationId': instance.operationId,
  'user': instance.user.toJson(),
  'employee': instance.employee?.toJson(),
};
