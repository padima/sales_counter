import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sales_counter/data/model/sales_model.dart';

import '../../tools/fixture_reader.dart';

void main() {
  final Map<String, dynamic> jsonMap = json.decode(
    fixtureReader('test/data/model/sales_model.json'),
  );

  final salesModel = SalesModel.fromMap(jsonMap);

  group(
    'toMap, fromMap',
    () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          // WHEN
          final result = salesModel.toMap();
          // THEN
          expect(result, jsonMap);
        },
      );
      test(
        'should return a valid model',
        () async {
          // WHEN
          final result = SalesModel.fromMap(jsonMap);
          // THEN
          expect(result, salesModel);
        },
      );
    },
  );
}
