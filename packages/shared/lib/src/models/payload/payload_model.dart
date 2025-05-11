import 'package:freezed_annotation/freezed_annotation.dart';

import '../aps/aps_model.dart';

part 'payload_model.freezed.dart';
part 'payload_model.g.dart';

@unfreezed
class PayloadModel with _$PayloadModel {
  factory PayloadModel({ApsModel? aps}) = _PayloadModel;

  factory PayloadModel.fromJson(Map<String, dynamic> json) => _$PayloadModelFromJson(json);
}
