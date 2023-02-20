import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/data/repository/barcode_scanner_repository.dart';
import 'package:sales_counter/data/source/flutter_barcode_scanner_source.dart';

final barcodeScannerRepositoryProvider = Provider<BarcodeScannerRepository>((ref) {
  final barcodeScannerSource = FlutterBarcodeScannerSource();
  return BarcodeScannerRepository(barcodeScannerSource: barcodeScannerSource);
});
