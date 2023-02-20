import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sales_counter/data/source/i_barcode_scanner_source.dart';

class FlutterBarcodeScannerSource extends IBarcodeScannerSource {
  @override
  Future<String> scanBarcode() async {
    final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.QR,
    );
    return barcodeScanRes;
  }

  @override
  void init() {}

  @override
  void dispose() {}
}
