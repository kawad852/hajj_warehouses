import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'operation_model.freezed.dart';
part 'operation_model.g.dart';

@unfreezed
class OperationModel with _$OperationModel {
  factory OperationModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String type,
    @Default('') String displayName,
  }) = _OperationModel;

  factory OperationModel.fromJson(Map<String, dynamic> json) => _$OperationModelFromJson(json);
}
