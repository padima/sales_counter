import 'package:sales_counter/domain/repository/i_repository.dart';

abstract class IBarcodeScannerRepository extends IRepository {
  Future<String> scanBarcode();
}
