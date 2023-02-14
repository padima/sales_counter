import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/data/model/settings_model.dart';
import 'package:sales_counter/domain/entity/data/i_settings.dart';
import 'package:sales_counter/ui/provider/repository/settings_repository_provider.dart';

class SettingsNotifier extends StateNotifier<ISettings> {
  final Ref _ref;
  late final StreamSubscription<ISettings>? streamSubscriptionSettings;

  SettingsNotifier(this._ref) : super(SettingsModel.empty()) {
    streamSubscriptionSettings = stream.listen((event) {
      saveSettings();
    });
  }

  Future<void> loadSettings() async {
    final settings = await _ref.read(settingsRepositoryProvider).readSettings();
    if (settings != state) state = settings;
  }

  void saveSettings() {
    try {
      _ref.read(settingsRepositoryProvider).writeSetting(state);
    } catch (error, stackTrace) {
      //TODO(Pilipenko): add error handling.
      assert(() {
        log(
          'Error:$error',
          error: error,
          stackTrace: stackTrace,
        );
        return true;
      }());
      rethrow;
    }
  }

  @override
  void dispose() {
    streamSubscriptionSettings?.cancel();
    super.dispose();
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, ISettings>(SettingsNotifier.new);
