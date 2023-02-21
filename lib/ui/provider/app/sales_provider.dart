import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/data/model/sales_model.dart';
import 'package:sales_counter/domain/entity/data/i_sales.dart';
import 'package:sales_counter/ui/provider/repository/local_storages_repository_provider.dart';
import 'package:sales_counter/ui/provider/use_case/sales/read_sales_use_case_provider.dart';
import 'package:sales_counter/ui/provider/use_case/sales/write_sales_use_case_provider.dart';

class SalesNotifier extends StateNotifier<ISales> {
  final Ref _ref;

  SalesNotifier(this._ref) : super(SalesModel.emptyClient());

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
      final readSalesUseCase = _ref.read(readSalesUseCaseProvider);
      state = readSalesUseCase(clientID);
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
    if (state.userID == '') return;
    try {
      final writeSalesUseCase = _ref.read(writeSalesUseCaseProvider);
      writeSalesUseCase(state);
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

  void addSale() {
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
