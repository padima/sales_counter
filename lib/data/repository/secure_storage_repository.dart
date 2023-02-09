import 'dart:convert';

import 'package:sales_counter/data/model/settings_model.dart';
import 'package:sales_counter/data/source/i_secure_storage_source.dart';
import 'package:sales_counter/domain/entity/data/i_settings.dart';
import 'package:sales_counter/domain/repository/i_secure_storage_repository.dart';

class SecureStorageRepository extends ISecureStorageRepository {
  SecureStorageRepository({
    required ISecureStorageSource secureStoreSource,
  }) : _secureStoreSource = secureStoreSource;

  final ISecureStorageSource _secureStoreSource;

  void _write(String key, String value) => _secureStoreSource.write(key, value);

  Future<String?> _read(String key) async => _secureStoreSource.read(key);

  @override
  Future<ISettings?> loadSettings() async {
    final stringSettings = await _read('appSettings');
    if (stringSettings == null) return SettingsModel.empty();
    return SettingsModel.fromMap(
      json.decode(stringSettings) as Map<String, dynamic>,
    );
  }

  @override
  void saveSetting(ISettings? appSettings) {
    if (appSettings == null) return;
    final jsonSettings = json.encode(appSettings.toMap());
    _write('appSettings', jsonSettings);
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
