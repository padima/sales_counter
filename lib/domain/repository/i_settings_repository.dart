import 'package:sales_counter/domain/entity/data/i_settings.dart';
import 'package:sales_counter/domain/repository/i_repository.dart';

abstract class ISettingsRepository extends IRepository {
  Future<ISettings?> readSettings();

  void writeSetting(ISettings? appSettings);
}
