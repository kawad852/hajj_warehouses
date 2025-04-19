import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared.dart';

part 'inventory_operation_model.freezed.dart';
part 'inventory_operation_model.g.dart';

@unfreezed
class InventoryOperationModel with _$InventoryOperationModel {
  factory InventoryOperationModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String type,
    @Default('') String displayName,
  }) = _InventoryOperationModel;

  factory InventoryOperationModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryOperationModelFromJson(json);
}
