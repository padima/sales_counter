import 'package:sales_counter/data/source/i_source.dart';

abstract class ILocalStorageSource extends ISource {
  Future<void> openStorage(Map<String, dynamic> settings);

  Map<String, dynamic> readStorageData({
    required String storageName,
    required String key,
  });

  void writeStorageData({
    required String storageName,
    required String key,
    required Map<String, dynamic> values,
  });

  @override
  Future<void> dispose();

  @override
  Future<void> init();
}
