import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/ui/provider/app/settings_provider.dart';

@immutable
class HomeState {
  final String userID;

  const HomeState({required this.userID});

  factory HomeState.empty() => const HomeState(userID: '');

  HomeState copyWith({
    String? userID,
  }) {
    return HomeState(
      userID: userID ?? this.userID,
    );
  }
}

class HomePresenterNotifier extends StateNotifier<HomeState> {
  final Ref _ref;

  HomePresenterNotifier(this._ref) : super(HomeState.empty()) {
    final userId = _ref.watch(settingsProvider.select((settings) => settings.userId));
    if (state.userID != userId) state = state.copyWith(userID: userId);
  }

  String getClientCardData() {
    final settings = _ref.watch(settingsProvider);
    final clientCard = <String, dynamic>{
      'userId': settings.userId,
      'userName': settings.userName,
      'userEmail': settings.userEmail,
    };
    final jsonClientCard = json.encode(clientCard);
    return jsonClientCard;
  }
}
