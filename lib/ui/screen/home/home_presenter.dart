import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/core/resources/app_routes.dart';
import 'package:sales_counter/ui/navigator/main_navigator.dart';
import 'package:sales_counter/ui/provider/app/sales_provider.dart';
import 'package:sales_counter/ui/provider/use_case/sales/scan_barcode_use_case_provider.dart';

@immutable
class HomeScreenState {
  final int indexPage;
  final String userName;
  final String userEmail;

  const HomeScreenState({
    this.indexPage = 0,
    this.userName = '',
    this.userEmail = '',
  });

  factory HomeScreenState.empty() => const HomeScreenState();

  HomeScreenState copyWith({
    int? indexPage,
    String? barcodeScan,
    String? userName,
    String? userEmail,
  }) {
    return HomeScreenState(
      indexPage: indexPage ?? this.indexPage,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
    );
  }
}

class HomeScreenPresenterNotifier extends StateNotifier<HomeScreenState> {
  final Ref _ref;

  HomeScreenPresenterNotifier(this._ref) : super(HomeScreenState.empty());

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
      userName: barcode.userName,
      userEmail: barcode.userEmail,
    );
    if (barcode.userId != '') {
      _ref.read(salesProvider.notifier).readSales(barcode.userId);
      changeIndexPage(1);
    }
  }

  void addSale() {
    _ref.read(salesProvider.notifier).addSale();
  }
}
