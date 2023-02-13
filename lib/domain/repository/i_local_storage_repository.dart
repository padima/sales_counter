import 'package:sales_counter/domain/entity/data/i_sales.dart';
import 'package:sales_counter/domain/repository/i_repository.dart';

abstract class ILocalStorageRepository extends IRepository {
  ISales readData(String key);

  void writeData(ISales sales);

  @override
  Future<void> init();
}
