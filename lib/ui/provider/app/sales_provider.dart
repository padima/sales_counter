import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class SalesState {
  const SalesState();

  factory SalesState.empty() => const SalesState();
}

class SalesNotifier extends StateNotifier<SalesState> {
  final Ref _ref;
  Box<int>? box;

  SalesNotifier(this._ref) : super(SalesState.empty());

  Future<void> initial() async {
    box = await Hive.openBox('sales');
  }

  int getNumberOfSales(String clientID) {
    final result = box?.get(clientID) ?? 0;
    return result;
  }

  void addSales(String clientID) {
    final result = (box?.get(clientID) ?? 0) + 1;
    box?.put(clientID, result);
  }

  @override
  void dispose() {
    box?.close();
    super.dispose();
  }
}

final salesProvider = StateNotifierProvider<SalesNotifier, SalesState>(SalesNotifier.new);
