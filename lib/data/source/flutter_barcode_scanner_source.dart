import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sales_counter/core/resources/app_exception.dart';
import 'package:sales_counter/data/source/interface/i_barcode_scanner_source.dart';

class FlutterBarcodeScannerSource extends IBarcodeScannerSource {
  @override
  Future<String> scanBarcode() async {
    final barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.QR,
    );
    if (barcodeScanResult == '-1') throw NullReturnException();
    return barcodeScanResult;
  }

  @override
  void init() {}

  @override
  void dispose() {}
}
