import 'dart:convert';

import 'package:app/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../models/country/country_model.dart';
import '../models/object_box/object_box_model.dart';

class MyObjectBoxes {
  static late Store store;
  static late Box<ObjectBoxModel> box;

  static Future<void> init() async {
    final docsDir = await getApplicationDocumentsDirectory();
    store = await openStore(directory: p.join(docsDir.path, "obx-example"));
    box = store.box<ObjectBoxModel>();
  }

  static List<CountryModel> get countries {
    final cachedData = box.query(ObjectBoxModel_.key.equals('countries')).build().findFirst();
    if (cachedData != null) {
      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
        jsonDecode(cachedData.data),
      );
      return data.map((e) => CountryModel.fromJson(e)).toList();
    }
    return [];
  }

  static set countries(List<CountryModel> value) {
    final oldData = box.query(ObjectBoxModel_.key.equals('countries')).build().findFirst();
    if (oldData != null) {
      box.remove(oldData.id);
    }
    box.put(ObjectBoxModel(key: 'countries', data: jsonEncode(value)));
  }
}
