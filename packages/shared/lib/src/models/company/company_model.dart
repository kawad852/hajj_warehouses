import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@unfreezed
class CompanyModel with _$CompanyModel {
  factory CompanyModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? name,
    Subscription? subscription,
    String? intermediaryId,
    ServiceData? serviceData,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);
}

@freezed
class Subscription with _$Subscription {
  factory Subscription({
    String? id,
    @TimestampSerializer() DateTime? createdAt,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);
}

@freezed
class ServiceData with _$ServiceData {
  factory ServiceData({
    String? id,
    String? db,
    String? login,
    String? password,
  }) = _ServiceData;

  factory ServiceData.fromJson(Map<String, dynamic> json) => _$ServiceDataFromJson(json);
}
