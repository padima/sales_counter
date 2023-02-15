import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/domain/use_case/settings/read_settings_use_case.dart';
import 'package:sales_counter/ui/provider/repository/settings_repository_provider.dart';

final readSettingsUseCaseProvider = Provider<ReadSettingsUseCase>((ref) {
  final settingsRepository = ref.watch(settingsRepositoryProvider);
  return ReadSettingsUseCase(settingsRepository: settingsRepository);
});
