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
    'SettingsModel toMap, fromMap',
    () {
      test(
        'SettingsModel toMap',
        () {
          expect(model.toMap(), jsonMap);
        },
      );
      test(
        'SettingsModel fromMap',
        () {
          expect(SettingsModel.fromMap(jsonMap), model);
        },
      );
    },
  );
}
