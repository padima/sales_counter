import 'package:hive_flutter/adapters.dart';
import 'package:sales_counter/core/resources/app_exception.dart';
import 'package:sales_counter/data/source/interface/i_local_storage_source.dart';

class HiveStorageSources extends ILocalStorageSource {
  final storages = <String, Box>{};

  @override
  Future<void> openStorage({
    required Map<String, dynamic> settings,
  }) async {
    final boxes = settings['openBox'] as List<String>;
    for (final boxName in boxes) {
      if (storages[boxName] is Box<int>) return;
      final Box<int> box;
      try {
        box = await Hive.openBox<int>(boxName);
      } catch (e) {
        throw NotOpenedStorageException('Storage not opened, storage name:$boxName. Error data:$e.');
      }
      storages[boxName] = box;
    }
  }

  @override
  int readStorageData({
    required String storageName,
    required String key,
  }) {
    final storage = storages[storageName];
    if (storage != null) {
      final result = storage.get(key);
      if (result == null) {
        throw NullReturnException('Return NULL, storage:$storageName, key:$key.');
      }
      return result;
    } else {
      throw NotOpenedStorageException('Storage not opened, storage name:$storageName.');
    }
  }

  @override
  void writeStorageData({
    required String storageName,
    required String key,
    required int values,
  }) {
    final storage = storages[storageName];
    if (storage != null) {
      storage.put(key, values);
    } else {
      throw NotOpenedStorageException('Storage not opened, storage name:$storageName.');
    }
  }

  @override
  Future<void> dispose() async {
    await Hive.close();
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
  }
}
