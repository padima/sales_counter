import 'package:sales_counter/domain/entity/data/i_data_barcode.dart';
import 'package:sales_counter/domain/repository/i_repository.dart';

abstract class IBarcodeScannerRepository extends IRepository {
  Future<IDataBarcode> scanBarcode();
}
