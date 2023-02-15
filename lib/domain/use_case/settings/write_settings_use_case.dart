import 'package:sales_counter/domain/entity/data/i_settings.dart';
import 'package:sales_counter/domain/repository/i_settings_repository.dart';
import 'package:sales_counter/domain/use_case/i_use_case.dart';

class WriteSettingsUseCase extends IUseCaseReturnVoidArgumentType<ISettings> {
  final ISettingsRepository settingsRepository;

  WriteSettingsUseCase({required this.settingsRepository});

  @override
  void call(ISettings argument) {
    return settingsRepository.writeSetting(argument);
  }
}
