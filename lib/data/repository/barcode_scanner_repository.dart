import 'package:sales_counter/data/source/i_barcode_scanner_source.dart';
import 'package:sales_counter/domain/repository/i_barcode_scanner_repository.dart';

class BarcodeScannerRepository extends IBarcodeScannerRepository {
  final IBarcodeScannerSource barcodeScannerSource;

  BarcodeScannerRepository({
    required this.barcodeScannerSource,
  });

  @override
  Future<String> scanBarcode() async {
    final scanData = ;
  }

  @override
  void dispose() {}

  @override
  void init() {}
}
