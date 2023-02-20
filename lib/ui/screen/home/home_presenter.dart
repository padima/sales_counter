import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/core/resources/app_routes.dart';
import 'package:sales_counter/data/model/sales_model.dart';
import 'package:sales_counter/domain/entity/data/i_sales.dart';
import 'package:sales_counter/ui/navigator/main_navigator.dart';
import 'package:sales_counter/ui/provider/app/settings_provider.dart';
import 'package:sales_counter/ui/provider/use_case/sales/read_sales_use_case_provider.dart';
import 'package:sales_counter/ui/provider/use_case/sales/scan_barcode_use_case_provider.dart';

@immutable
class HomeScreenState {
  final int indexPage;
  final String barcodeScan;
  final ISales sales;

  const HomeScreenState({
    this.indexPage = 0,
    this.barcodeScan = '',
    this.sales = const SalesModel(
      userID: '',
      count: 0,
      sales: [],
    ),
  });

  factory HomeScreenState.empty() => const HomeScreenState();

  HomeScreenState copyWith({
    int? indexPage,
    String? barcodeScan,
  }) {
    return HomeScreenState(
      indexPage: indexPage ?? this.indexPage,
      barcodeScan: barcodeScan ?? this.barcodeScan,
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

  Future<void> getBarcode() async {
    final barcodeScannerUseCase = _ref.read(scanBarcodeUseCase);
    final barcode = await barcodeScannerUseCase();
    state = state.copyWith(
      barcodeScan: barcode,
      indexPage: 1,
    );
  }

  Future<void> readSalesData() async {
    final readSalesUseCase = _ref.read(readSalesUseCaseProvider);
    final resultReadSales = readSalesUseCase(state.barcodeScan);
  }
}
