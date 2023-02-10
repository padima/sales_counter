import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/data/repository/settings_repository.dart';
import 'package:sales_counter/data/source/secure_storage_source.dart';

final settingsRepository = Provider<SettingsRepository>(
  (ref) => SettingsRepository(
    secureStoreSource: SecureStorageSource(),
  ),
);
