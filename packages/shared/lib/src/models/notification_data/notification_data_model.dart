import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_data_model.freezed.dart';
part 'notification_data_model.g.dart';

@unfreezed
class NotificationDataModel with _$NotificationDataModel {
  factory NotificationDataModel({String? id, String? type}) = _NotificationDataModel;

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataModelFromJson(json);
}
