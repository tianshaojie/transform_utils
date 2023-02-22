const String NULL = "null";
const String TRUE = "true";

class ParseUtil {
  static String parseString(dynamic data, [String defaultValue = ""]) {
    return data?.toString() ?? defaultValue;
  }

  static double parseDouble(dynamic data, [double defaultValue = double.nan]) {
    if (data == null) {
      return defaultValue;
    }
    try {
      return double.parse(data.toString());
    } catch (ignored) {
      return defaultValue;
    }
  }

  static int parseInt(dynamic data, [int defaultValue = 0, bool floor = true]) {
    double core = parseDouble(data);
    return floor ? core.floor() : core.ceil();
  }

  static bool parseBool(dynamic data, [bool defaultValue = false]) {
    if (data == null) {
      return false;
    }
    if (data is bool) {
      return data;
    } else {
      return TRUE == parseString(data).toLowerCase();
    }
  }
}
