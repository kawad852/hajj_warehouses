import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/ui_helper.dart';

part 'policy_model.freezed.dart';
part 'policy_model.g.dart';

@unfreezed
class PolicyModel with _$PolicyModel {
  factory PolicyModel({
    @Default('') String id,
    @Default('') String contentEn,
    @Default('') String contentAr,
    @Default('') String titleEn,
    @Default('') String titleAr,
  }) = _PolicyModel;

  factory PolicyModel.fromJson(Map<String, dynamic> json) => _$PolicyModelFromJson(json);

  PolicyModel._();

  String get title {
    return UiHelper.translate(textEN: titleEn, textAR: titleAr);
  }

  String get content {
    return UiHelper.translate(textEN: contentEn, textAR: contentAr);
  }
}
