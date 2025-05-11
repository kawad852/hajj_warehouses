import 'package:freezed_annotation/freezed_annotation.dart';

part 'aps_model.freezed.dart';
part 'aps_model.g.dart';

@unfreezed
class ApsModel with _$ApsModel {
  factory ApsModel({
    String? sound,
  }) = _ApsModel;

  factory ApsModel.fromJson(Map<String, dynamic> json) => _$ApsModelFromJson(json);
}
