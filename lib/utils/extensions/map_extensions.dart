import 'dart:collection';

extension MapExtensions on Map {
  Map sortKeysByValue() {
    var sortedKeys = keys.toList(growable: false)
      ..sort(
        (k1, k2) => this[k1].compareTo(this[k2]),
      );

    return LinkedHashMap.fromIterable(
      sortedKeys,
      key: (k) => k,
      value: (k) => this[k],
    );
  }

  Map take(int count) {
    int i = 0;
    Map output = {};
    for (final entry in entries) {
      if (i < count) break;
      output[entry.key] = entry.value;
      i++;
    }
    return output;
  }

  Map takeUpTo(int count) {
    if (length < count) count = length;
    return take(count);
  }
}
