import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  HomeState();

  factory HomeState.empty() => HomeState();
}

class HomePresenterNotifier extends StateNotifier<HomeState> {
  final Ref _ref;

  HomePresenterNotifier(this._ref) : super(HomeState.empty());
}
