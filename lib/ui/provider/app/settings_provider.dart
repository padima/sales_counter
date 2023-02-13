import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/core/resources/app_exception.dart';
import 'package:sales_counter/data/model/settings_model.dart';
import 'package:sales_counter/domain/entity/data/i_settings.dart';
import 'package:sales_counter/ui/provider/repository/settings_repository_provider.dart';
import 'package:uuid/uuid.dart';

class SettingsNotifier extends StateNotifier<ISettings> {
  final Ref _ref;
  late final StreamSubscription<ISettings>? streamSubscriptionSettings;

  SettingsNotifier(this._ref) : super(SettingsModel.empty()) {
    streamSubscriptionSettings = stream.listen((event) {
      saveSettings();
    });
  }

  Future<void> loadSettings() async {
    try {
      final settings = await _ref.read(settingsRepositoryProvider).loadSettings();
      if (settings != state) state = settings;
    } on NullReturnException {
      if (state.userId == '') {
        state = state.copyWith(
          userId: const Uuid().v4(),
        );
      }
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

  void saveSettings() {
    try {
      _ref.read(settingsRepositoryProvider).saveSetting(state);
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
