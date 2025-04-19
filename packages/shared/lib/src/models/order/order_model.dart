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
    @Default('') String note,
    @Default('') String userId,
    required String status,
    @Default(false) bool urgent,
    required List<LightItemModel> items,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  OrderModel._();

  Future<String> getId() async => RowIdHelper.getOrderId(RowIdHelper.orderId);
}
