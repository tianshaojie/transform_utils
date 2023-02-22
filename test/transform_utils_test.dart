import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:transform_utils/transform_utils.dart';

void main() {
  test('option map', () {
    OptionMap<dynamic, dynamic> optionMap = OptionMap()..addAll({"a": 1, "b": "true"});
    expect(optionMap.optString("a"), "1");
    expect(optionMap.optInt("a"), 1);
    expect(optionMap.optDouble("a"), 1.0);
    expect(optionMap.optBool("b"), true);
  });

  test('option list', () {

    String data = '''["a",1,"true"]''';
    OptionList<dynamic> optionList = OptionList()..addAll(jsonDecode(data));
    expect(jsonEncode(optionList), data);
    expect(optionList.optString(0), "a");
    expect(optionList.optInt(1), 1);
    expect(optionList.optDouble(1), 1.0);
    expect(optionList.optBool(2), true);
  });
}
