import 'delegates/map.dart';
import 'parse_utils.dart';

class OptionMap<K, V> extends DelegatingMap<K, V> {
  final Map<K, V> _m = {};

  Map<K, V> get delegate => _m;

  @override
  V? operator [](Object? key) => delegate[key];

  String optString(K key, [String defaultValue = ""]) {
    dynamic result = delegate[key].toString();
    return (null == result || NULL == result) ? defaultValue : result;
  }

  double optDouble(K key, [double defaultValue = double.nan]) {
    dynamic result = delegate[key];
    return ParseUtil.parseDouble(result);
  }

  double optFloat(K key, [double defaultValue = double.nan]) {
    return optDouble(key, defaultValue);
  }

  int optInt(K key, [int defaultValue = 0]) {
    dynamic result = delegate[key];
    return ParseUtil.parseInt(result, defaultValue);
  }

  int optLong(K key, [int defaultValue = 0]) {
    return optLong(key, defaultValue);
  }

  bool optBool(K key, [bool defaultValue = false]) {
    dynamic result = delegate[key];
    return ParseUtil.parseBool(result);
  }

  Map<dynamic, dynamic> optJSONObject(String key) {
    try {
      return (delegate[key] ?? {}) as Map;
    } catch (ignored) {
      return {};
    }
  }

  Map<dynamic, dynamic> getJSONObject(String key) {
    return optJSONObject(key);
  }

  List<dynamic> optJSONArray(String key) {
    try {
      return (delegate[key] ?? []) as List;
    } catch (ignored) {
      return [];
    }
  }

  List<dynamic> getJSONArray(String key) {
    return optJSONArray(key);
  }

}
