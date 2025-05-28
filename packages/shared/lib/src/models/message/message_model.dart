import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@unfreezed
class MessageModel with _$MessageModel {
  factory MessageModel({
    @TimestampSerializer() DateTime? createTime,
    String? id,
    String? prompt,
    String? response,
    StatusModel? status,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}

@unfreezed
class StatusModel with _$StatusModel {
  factory StatusModel({String? state, String? error}) = _StatusModel;

  factory StatusModel.fromJson(Map<String, dynamic> json) => _$StatusModelFromJson(json);
}

@unfreezed
class AdminMessageModel with _$AdminMessageModel {
  factory AdminMessageModel({@TimestampSerializer() DateTime? createdAt, String? id, String? msg}) =
      _AdminMessageModel;

  factory AdminMessageModel.fromJson(Map<String, dynamic> json) =>
      _$AdminMessageModelFromJson(json);
}
