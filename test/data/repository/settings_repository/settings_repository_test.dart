import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sales_counter/data/model/settings_model.dart';
import 'package:sales_counter/data/repository/settings_repository.dart';
import 'package:sales_counter/data/source/i_secure_storage_source.dart';

import '../../../tools/fixture_reader.dart';

class MockSecureStorageSource extends Mock implements ISecureStorageSource {}

void main() {
  late final MockSecureStorageSource mockSecureStorageSource;
  late final SettingsRepository settingsRepository;

  setUpAll(() {
    mockSecureStorageSource = MockSecureStorageSource();
    settingsRepository = SettingsRepository(secureStoreSource: mockSecureStorageSource);
  });

  group(
    'SettingsRepository',
    () {
      test(
        'SettingsRepository.readSettings()',
        () async {
          final jsonString = fixtureReader('test/data/model/settings_model/settings_model.json');
          final settings = SettingsModel.fromMap(json.decode(jsonString));
          when(() => mockSecureStorageSource.readData('appSettingsSalesCounter')).thenAnswer((_) async => jsonString);
          final result = await settingsRepository.readSettings();
          expect(result, settings);
        },
      );
      test(
        'SettingsRepository.writeSetting()',
        () {
          final jsonString = fixtureReader('test/data/model/settings_model/settings_model.json');
          final settings = SettingsModel.fromMap(json.decode(jsonString));
          settingsRepository.writeSetting(settings);
          expect(1, 1);
        },
      );
    },
  );
}
