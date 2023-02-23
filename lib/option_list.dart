import 'delegates/list.dart';
import 'option_map.dart';
import 'parse_utils.dart';

class OptionList<E> extends DelegatingList<E> {
  final List<E> _l = [];

  List<E> get delegate => _l;

  String optString(int index, [String defaultValue = ""]) {
    dynamic result;
    if (index >= 0 && index < delegate.length) {
      result = delegate[index].toString();
    }
    return (null == result || NULL == result) ? defaultValue : result;
  }

  double optDouble(int index, [double defaultValue = double.nan]) {
    dynamic result;
    if (index >= 0 && index < delegate.length) {
      result = delegate[index];
    }
    return ParseUtil.parseDouble(result, defaultValue);
  }

  double optFloat(int index, [double defaultValue = double.nan]) {
    return optDouble(index, defaultValue);
  }

  int optInt(int index, [int defaultValue = 0]) {
    dynamic result;
    if (index >= 0 && index < delegate.length) {
      result = delegate[index];
    }
    return ParseUtil.parseInt(result, defaultValue);
  }

  int optLong(int index, [int defaultValue = 0]) {
    return optInt(index, defaultValue);
  }

  bool optBool(int index, [bool defaultValue = false]) {
    dynamic result;
    if (index >= 0 && index < delegate.length) {
      result = delegate[index];
    }
    return ParseUtil.parseBool(result, defaultValue);
  }

  OptionMap<dynamic, dynamic> optJSONObject(int index) {
    try {
      return OptionMap()..addAll((delegate[index] ?? {}) as Map);
    } catch (ignored) {
      return OptionMap();
    }
  }

  OptionMap<dynamic, dynamic> getJSONObject(int index) {
    return optJSONObject(index);
  }

  OptionList<dynamic> optJSONArray(int index) {
    try {
      return OptionList()..addAll((delegate[index] ?? []) as List);
    } catch (ignored) {
      return OptionList();
    }
  }

  OptionList<dynamic> getJSONArray(int index) {
    return optJSONArray(index);
  }
}
