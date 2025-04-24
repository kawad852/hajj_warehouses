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
    LightUserModel? user,
    required String status,
    InventoryOperationModel? operation,
    @Default([]) List<OrderRecordModel> orderRecords,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  OrderModel._();

  Future<String> getId() async => RowIdHelper.get(RowIdHelper.orderId);
}

@unfreezed
class OrderRecordModel with _$OrderRecordModel {
  @JsonSerializable(explicitToJson: true)
  factory OrderRecordModel({
    @TimestampSerializer() DateTime? time,
    required String status,
    LightUserModel? user,
    @Default([]) List<String> images,
  }) = _OrderRecordModel;

  factory OrderRecordModel.fromJson(Map<String, dynamic> json) => _$OrderRecordModelFromJson(json);
}
