import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/domain/use_case/settings/write_settings_use_case.dart';
import 'package:sales_counter/ui/provider/repository/settings_repository_provider.dart';

final writeSettingsUseCaseProvider = Provider<WriteSettingsUseCase>((ref) {
  final settingsRepository = ref.watch(settingsRepositoryProvider);
  return WriteSettingsUseCase(settingsRepository: settingsRepository);
});
