import 'dart:convert';
import 'dart:developer';

import 'package:sales_counter/data/model/settings_model.dart';
import 'package:sales_counter/data/source/i_secure_storage_source.dart';
import 'package:sales_counter/domain/entity/data/i_settings.dart';
import 'package:sales_counter/domain/repository/i_settings_repository.dart';
import 'package:uuid/uuid.dart';

class SettingsRepository extends ISettingsRepository {
  SettingsRepository({
    required ISecureStorageSource secureStoreSource,
  }) : _secureStoreSource = secureStoreSource;

  final ISecureStorageSource _secureStoreSource;

  @override
  Future<ISettings> readSettings() async {
    try {
      final stringSettings = await _secureStoreSource.readData('appSettingsSalesCounter');
      ISettings resultSettings = SettingsModel.fromMap(
        json.decode(stringSettings) as Map<String, dynamic>,
      );
      if (resultSettings.userId == '') {
        resultSettings = resultSettings.copyWith(
          userId: const Uuid().v4().toString(),
        );
      }
      return resultSettings;
    } catch (error, stackTrace) {
      assert(() {
        log(
          'Error:$error',
          error: error,
          stackTrace: stackTrace,
        );
        return true;
      }());
      final resultSettings = SettingsModel.empty().copyWith(
        userId: const Uuid().v4().toString(),
      );
      return resultSettings;
    }
  }

  @override
  void writeSetting(ISettings? appSettings) {
    try {
      if (appSettings == null) return;
      final jsonSettings = json.encode(appSettings.toMap());
      _secureStoreSource.writeData('appSettingsSalesCounter', jsonSettings);
    } catch (error, stackTrace) {
      assert(() {
        log(
          'Error:$error',
          error: error,
          stackTrace: stackTrace,
        );
        return true;
      }());
      rethrow;
    }
  }

  @override
  void dispose() {
    _secureStoreSource.dispose();
  }

  @override
  void init() {
    _secureStoreSource.init();
  }
}
