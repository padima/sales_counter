import 'package:sales_counter/domain/entity/data/i_settings.dart';
import 'package:sales_counter/domain/repository/i_repository.dart';

abstract class ISecureStorageRepository extends IRepository {
  Future<ISettings?> loadSettings();

  void saveSetting(ISettings? appSettings);
}
