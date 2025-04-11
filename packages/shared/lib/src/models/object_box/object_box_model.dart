import 'package:objectbox/objectbox.dart';

@Entity()
class ObjectBoxModel {
  int id = 0; // ObjectBox requires an ID field.
  String key; // e.g., "countries" or "categories"
  String data; // JSON string

  ObjectBoxModel({
    required this.key,
    required this.data,
  });
}
