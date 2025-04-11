import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampSerializer implements JsonConverter<DateTime?, dynamic> {
  const TimestampSerializer();

  @override
  DateTime? fromJson(dynamic timestamp) {
    try {
      if (timestamp is Timestamp) {
        return timestamp.toDate();
      } else if (timestamp is int) {
        return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      } else {
        return timestamp;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Timestamp? toJson(DateTime? date) => date != null ? Timestamp.fromDate(date) : null;
}
