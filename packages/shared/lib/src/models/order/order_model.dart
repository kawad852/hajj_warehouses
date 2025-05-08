import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@unfreezed
class OrderModel with _$OrderModel {
  @JsonSerializable(explicitToJson: true)
  factory OrderModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    required LightUserModel user,
    required String status,
    InventoryOperationModel? operation,
    LightBranchModel? transferFromBranch,
    LightBranchModel? transferToBranch,
    required LightBranchModel branch,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  OrderModel._();

  Future<String> getId() async => RowIdHelper.get(RowIdHelper.orderId);
}

@unfreezed
class OrderHistoryModel with _$OrderHistoryModel {
  @JsonSerializable(explicitToJson: true)
  factory OrderHistoryModel({
    @TimestampSerializer() DateTime? time,
    required String status,
    required LightUserModel user,
    required LightBranchModel branch,
    @Default([]) List<String> images,
  }) = _OrderHistoryModel;

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryModelFromJson(json);
}
