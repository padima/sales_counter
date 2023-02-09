import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingNotifier extends StateNotifier<bool> {
  final Ref _ref;

  LoadingNotifier(this._ref) : super(false) {
    loadApp();
  }

  Future<void> loadApp() async {
    try {
      state = true;
    } catch (e) {
      log(e.toString());
    }
  }
}

final isLoadingProvider = StateNotifierProvider<LoadingNotifier, bool>(LoadingNotifier.new);
