class ObjectsComparer {
  static bool listEquals<T>(List<T>? list1, List<T>? list2) {
    if (list1 == null || list2 == null) {
      return list1 == list2;
    }
    if (list1.length != list2.length) {
      return false;
    }
    for (int i = 0; i < list1.length; i++) {
      if (!_deepEquals(list1[i], list2[i])) {
        return false;
      }
    }
    return true;
  }

  static bool mapsEqual(Map map1, Map map2) {
    if (map1.length != map2.length) {
      return false;
    }
    for (var key in map1.keys) {
      if (!map2.containsKey(key) || !_deepEquals(map1[key], map2[key])) {
        return false;
      }
    }
    return true;
  }

  static bool _deepEquals(Object? obj1, Object? obj2) {
    if (obj1 == null || obj2 == null) {
      return obj1 == obj2;
    }

    if (obj1 is List) {
      return obj2 is List && listEquals<Object?>(obj1 as List<Object?>, obj2 as List<Object?>);
    } else if (obj1 is Map) {
      return obj2 is Map && mapsEqual(obj1, obj2);
    } else if (obj1 is String) {
      return obj2 is String && obj1 == obj2;
    } else if (obj1 is int) {
      return obj2 is int && obj1 == obj2;
    } else if (obj1 is double) {
      return obj2 is double && obj1 == obj2;
    } else {
      return obj1 == obj2;
    }
  }
}
