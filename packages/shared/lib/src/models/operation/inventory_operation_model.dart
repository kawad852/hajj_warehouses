import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared.dart';

part 'inventory_operation_model.freezed.dart';
part 'inventory_operation_model.g.dart';

@unfreezed
class InventoryOperationModel with _$InventoryOperationModel {
  @JsonSerializable(explicitToJson: true)
  factory InventoryOperationModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    LightUserModel? user,
    String? notes,
    String? supplyType,
    String? requestType,
    String? destroyReason,
    required String operationType,
    @Default(0.0) double totalPayment,
    @Default(0) int quantity,
    required List<LightItemModel> items,
    @Default([]) List<String> itemIds,
    @Default([]) List<String> images,
  }) = _InventoryOperationModel;

  factory InventoryOperationModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryOperationModelFromJson(json);
}
