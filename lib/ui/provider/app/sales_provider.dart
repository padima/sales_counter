import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/data/model/sales_model.dart';
import 'package:sales_counter/domain/entity/data/i_sales.dart';
import 'package:sales_counter/ui/provider/repository/local_storages_repositpry_provider.dart';

class SalesNotifier extends StateNotifier<ISales> {
  final Ref _ref;

  SalesNotifier(this._ref) : super(SalesModel.empty());

  Future<void> initial() async {
    try {
      await _ref.read(localStorageRepositoryProvider).init();
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

  void readSales(String clientID) {
    try {
      state = _ref.read(localStorageRepositoryProvider).readData(clientID);
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

  void writeSales() {
    try {
      _ref.read(localStorageRepositoryProvider).writeData(state);
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

  void addCount(String clientID) {
    state = state.copyWith(count: state.count + 1);
    writeSales();
  }

  @override
  void dispose() {
    try {
      _ref.read(localStorageRepositoryProvider).dispose();
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
    super.dispose();
  }
}

final salesProvider = StateNotifierProvider<SalesNotifier, ISales>(SalesNotifier.new);
