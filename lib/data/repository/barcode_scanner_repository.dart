import 'dart:convert';

import 'package:sales_counter/core/resources/app_exception.dart';
import 'package:sales_counter/data/model/data_barcode_model.dart';
import 'package:sales_counter/data/source/interface/i_barcode_scanner_source.dart';
import 'package:sales_counter/domain/entity/data/i_data_barcode.dart';
import 'package:sales_counter/domain/repository/i_barcode_scanner_repository.dart';

class BarcodeScannerRepository extends IBarcodeScannerRepository {
  final IBarcodeScannerSource barcodeScannerSource;

  BarcodeScannerRepository({
    required this.barcodeScannerSource,
  });

  @override
  Future<IDataBarcode> scanBarcode() async {
    try {
      final scanData = await barcodeScannerSource.scanBarcode();
      final dataJson = jsonDecode(scanData);
      return DataBarcodeModel.fromMap(dataJson);
    } on NullReturnException {
      return DataBarcodeModel.empty();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {}

  @override
  void init() {}
}
