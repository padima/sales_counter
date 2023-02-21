import 'package:sales_counter/domain/entity/data/i_data_barcode.dart';
import 'package:sales_counter/domain/repository/i_barcode_scanner_repository.dart';
import 'package:sales_counter/domain/use_case/i_use_case.dart';

class ScanBarcodeUseCase extends IUseCaseReturnTypeNoArgument<Future<IDataBarcode>> {
  final IBarcodeScannerRepository barcodeScannerRepository;

  ScanBarcodeUseCase({
    required this.barcodeScannerRepository,
  });

  @override
  Future<IDataBarcode> call() async {
    return barcodeScannerRepository.scanBarcode();
  }
}
