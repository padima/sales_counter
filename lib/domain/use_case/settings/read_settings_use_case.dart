import 'package:sales_counter/domain/entity/data/i_settings.dart';
import 'package:sales_counter/domain/repository/i_settings_repository.dart';
import 'package:sales_counter/domain/use_case/i_use_case.dart';

class ReadSettingsUseCase extends IUseCaseReturnTypeNoArgument<Future<ISettings>> {
  final ISettingsRepository settingsRepository;

  ReadSettingsUseCase({required this.settingsRepository});

  @override
  Future<ISettings> call() async {
    return settingsRepository.readSettings();
  }
}
