import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/domain/use_case/sales/scan_barcode_use_case.dart';
import 'package:sales_counter/ui/provider/repository/barcode_scanner_repository_provider.dart';

final scanBarcodeUseCase = Provider<ScanBarcodeUseCase>((ref) {
  final barcodeScannerRepository = ref.watch(barcodeScannerRepositoryProvider);
  return ScanBarcodeUseCase(barcodeScannerRepository: barcodeScannerRepository);
});
