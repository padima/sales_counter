import 'package:sales_counter/domain/repository/i_barcode_scanner_repository.dart';
import 'package:sales_counter/domain/use_case/i_use_case.dart';

class ScanBarcodeUseCase extends IUseCaseReturnTypeNoArgument<Future<String>> {
  final IBarcodeScannerRepository barcodeScannerRepository;

  ScanBarcodeUseCase({
    required this.barcodeScannerRepository,
  });

  @override
  Future<String> call() async {
    return barcodeScannerRepository.scanBarcode();
  }
}
