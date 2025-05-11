import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared.dart';
import '../notification_data/notification_data_model.dart';
import '../notification_header/notification_header_model.dart';
import '../payload/payload_model.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@unfreezed
class NotificationModel with _$NotificationModel {
  factory NotificationModel({
    @JsonKey(includeToJson: false) @TimestampSerializer() DateTime? createdAt,
    NotificationDataModel? data,
    String? topic,
    String? token,
    NotificationHeaderModel? notification,
    @Default("high") String priority,
    PayloadModel? apns,
    @JsonKey(name: 'click_action') @Default("FLUTTER_NOTIFICATION_CLICK") String clickAction,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
