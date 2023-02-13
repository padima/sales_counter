import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  final String userID;

  HomeState({required this.userID});

  factory HomeState.empty() => HomeState(userID: '');
}

class HomePresenterNotifier extends StateNotifier<HomeState> {
  final Ref _ref;

  HomePresenterNotifier(this._ref) : super(HomeState.empty());
}
