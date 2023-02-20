import 'package:sales_counter/data/source/i_source.dart';

abstract class IBarcodeScannerSource extends ISource {
  Future<String> scanBarcode();
}
