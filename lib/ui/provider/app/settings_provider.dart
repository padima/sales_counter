import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/data/model/settings_model.dart';
import 'package:sales_counter/domain/entity/data/i_settings.dart';
import 'package:sales_counter/ui/provider/use_case/settings/read_settings_use_case_provider.dart';
import 'package:sales_counter/ui/provider/use_case/settings/write_settings_use_case_provider.dart';

class SettingsNotifier extends StateNotifier<ISettings> {
  final Ref _ref;
  late final StreamSubscription<ISettings>? streamSubscriptionSettings;

  SettingsNotifier(this._ref) : super(SettingsModel.empty()) {
    streamSubscriptionSettings = stream.listen((event) {
      writeSettings();
    });
  }

  Future<void> readSettings() async {
    final readSettingsUseCase = _ref.read(readSettingsUseCaseProvider);
    final settings = await readSettingsUseCase();
    if (settings != state) {
      state = settings;
    }
  }

  void writeSettings() {
    try {
      final writeSettingsUseCase = _ref.read(writeSettingsUseCaseProvider);
      writeSettingsUseCase(state);
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
