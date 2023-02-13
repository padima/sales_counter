import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/ui/provider/app/sales_provider.dart';
import 'package:sales_counter/ui/provider/app/settings_provider.dart';

class LoadingNotifier extends StateNotifier<bool> {
  final Ref _ref;

  LoadingNotifier(this._ref) : super(false) {
    loadApp();
  }

  Future<void> loadApp() async {
    try {
      await _ref.read(settingsProvider.notifier).loadSettings();
      if (_ref.read(settingsProvider).seller) {
        await _ref.read(salesProvider.notifier).initial();
      }
      state = true;
    } catch (e) {
      log(e.toString());
    }
  }
}

final isLoadingProvider = StateNotifierProvider<LoadingNotifier, bool>(LoadingNotifier.new);
