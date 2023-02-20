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
      if (_ref.read(settingsProvider).seller) {
        await loadSales();
      }
      await _ref.read(settingsProvider.notifier).readSettings();
      state = true;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> loadSales() async {
    await _ref.read(salesProvider.notifier).initial();
  }

  Future<void> reload() async {
    state = false;
    await Future.delayed(const Duration(milliseconds: 200));
    await loadApp();
  }
}

final isLoadingProvider = StateNotifierProvider<LoadingNotifier, bool>(LoadingNotifier.new);
