import 'package:hive_flutter/adapters.dart';
import 'package:sales_counter/core/resources/app_exception.dart';
import 'package:sales_counter/data/source/i_local_storage_source.dart';

class HiveStorageSources extends ILocalStorageSource {
  final storages = <String, Box<Map<String, dynamic>>>{};

  @override
  Future<void> dispose() async {
    await Hive.close();
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
  }

  @override
  Future<void> openStorage(Map<String, dynamic> settings) async {
    final boxes = settings['openBox'] as List<String>;
    for (final boxName in boxes) {
      final Box<Map<String, dynamic>> box;
      try {
        box = await Hive.openBox<Map<String, dynamic>>(boxName);
      } catch (e) {
        throw NotOpenedStorageException('Storage not opened, storage name:$boxName. Error data:$e.');
      }
      storages[boxName] = box;
    }
  }

  @override
  Map<String, dynamic> readStorageData({
    required String storageName,
    required String key,
  }) {
    final storage = storages[storageName];
    if (storage != null) {
      final result = storage.get(key);
      if (result == null) throw NullReturnException('Return NULL, storage:$storageName, key:$key.');
      return result;
    } else {
      throw NotOpenedStorageException('Storage not opened, storage name:$storageName.');
    }
  }

  @override
  void writeStorageData({
    required String storageName,
    required String key,
    required Map<String, dynamic> values,
  }) {
    final storage = storages[storageName];
    if (storage != null) {
      storage.put(key, values);
    } else {
      throw NotOpenedStorageException('Storage not opened, storage name:$storageName.');
    }
  }
}
