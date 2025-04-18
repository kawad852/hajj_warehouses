import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared.dart';

part 'inventory_operation_model.freezed.dart';
part 'inventory_operation_model.g.dart';

@unfreezed
class InventoryOperationModel with _$InventoryOperationModel {
  factory InventoryOperationModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String displayName,
    @Default('') String notes,
    required String operationType,
    required String supplyType,
    @Default(0.0) double totalPayment,
    @Default(0) int quantity,
    @Default([]) List<LightItemModel> items,
    @Default([]) List<String> images,
    @Default(false) bool isUrgent,
  }) = _InventoryOperationModel;

  factory InventoryOperationModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryOperationModelFromJson(json);
}
