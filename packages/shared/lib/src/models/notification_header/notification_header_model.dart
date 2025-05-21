import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_header_model.freezed.dart';
part 'notification_header_model.g.dart';

@unfreezed
class NotificationHeaderModel with _$NotificationHeaderModel {
  factory NotificationHeaderModel({
    String? title,
    String? body,
    String? image,
    // @Default("default") String sound,
  }) = _NotificationHeaderModel;

  factory NotificationHeaderModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationHeaderModelFromJson(json);
}
