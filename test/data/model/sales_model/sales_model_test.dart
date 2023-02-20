import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sales_counter/data/model/sales_model.dart';

import '../../../tools/fixture_reader.dart';

void main() {
  final Map<String, dynamic> jsonMap = json.decode(
    fixtureReader('test/data/model/sales_model/sales_model.json'),
  );

  final salesModel = SalesModel.fromMap(jsonMap);

  group(
    'SalesModel toMap, fromMap',
    () {
      test(
        'SalesModel toMap',
        () {
          final result = salesModel.toMap();
          expect(result, jsonMap);
        },
      );
      test(
        'SalesModel fromMap',
        () {
          final result = SalesModel.fromMap(jsonMap);
          expect(result, salesModel);
        },
      );
    },
  );
}
