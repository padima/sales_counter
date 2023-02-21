import 'package:sales_counter/data/source/interface/i_source.dart';

abstract class ILocalStorageSource extends ISource {
  Future<void> openStorage({required Map<String, dynamic> settings});

  int readStorageData({
    required String storageName,
    required String key,
  });

  void writeStorageData({
    required String storageName,
    required String key,
    required int values,
  });

  @override
  Future<void> dispose();

  @override
  Future<void> init();
}
