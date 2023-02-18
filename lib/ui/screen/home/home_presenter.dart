import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/core/resources/app_routes.dart';
import 'package:sales_counter/ui/navigator/main_navigator.dart';
import 'package:sales_counter/ui/provider/app/settings_provider.dart';

@immutable
class HomeScreenState {
  final int indexPage;

  const HomeScreenState({
    this.indexPage = 0,
  });

  factory HomeScreenState.empty() => const HomeScreenState();

  HomeScreenState copyWith({
    int? indexPage,
  }) {
    return HomeScreenState(
      indexPage: indexPage ?? this.indexPage,
    );
  }
}

class HomeScreenPresenterNotifier extends StateNotifier<HomeScreenState> {
  final Ref _ref;

  HomeScreenPresenterNotifier(this._ref) : super(HomeScreenState.empty());

  String getClientCardData() {
    final settings = _ref.read(settingsProvider);
    final clientCard = <String, dynamic>{
      'userId': settings.userId,
      'userName': settings.userName,
      'userEmail': settings.userEmail,
    };
    final jsonClientCard = json.encode(clientCard);
    return jsonClientCard;
  }

  void changeIndexPage(int indexPage) {
    if (state.indexPage != indexPage) state = state.copyWith(indexPage: indexPage);
  }

  void goSettingsScreen() {
    _ref.read(mainNavigatorProvider).go('${AppRoutes.screenHome}${AppRoutes.screenSettings}');
  }
}
