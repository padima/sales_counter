import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sales_counter/data/model/settings_model.dart';

import '../../../tools/fixture_reader.dart';

void main() {
  final Map<String, dynamic> jsonMap = json.decode(
    fixtureReader('test/data/model/settings_model/settings_model.json'),
  );

  final model = SettingsModel.fromMap(jsonMap);

  group(
    'toMap, fromMap',
    () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          expect(model.toMap(), jsonMap);
        },
      );
      test(
        'should return a valid model',
        () async {
          expect(SettingsModel.fromMap(jsonMap), model);
        },
      );
    },
  );
}
