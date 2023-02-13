import 'package:sales_counter/data/source/i_source.dart';

abstract class ISecureStorageSource extends ISource {
  void write(String key, String value);

  Future<String> read(String key);
}
