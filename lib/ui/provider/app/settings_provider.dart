import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/data/model/settings_model.dart';
import 'package:sales_counter/domain/entity/data/i_settings.dart';
import 'package:sales_counter/ui/provider/repository/settings_repository.dart';

class SettingsNotifier extends StateNotifier<ISettings> {
  final Ref _ref;

  SettingsNotifier(this._ref) : super(SettingsModel.empty());

  Future<void> loadSettings() async {
    final settings = await _ref.read(settingsRepository).loadSettings();
    if (settings != null) state = settings;
  }

  void saveSettings() {
    _ref.read(settingsRepository).saveSetting(state);
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, ISettings>(SettingsNotifier.new);
