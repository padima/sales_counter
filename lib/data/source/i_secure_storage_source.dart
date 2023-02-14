import 'package:sales_counter/data/source/i_source.dart';

abstract class ISecureStorageSource extends ISource {
  void writeData(String key, String value);

  Future<String> readData(String key);
}
