import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:sales_counter/core/localized/generated/l10n.dart';
import 'package:sales_counter/ui/provider/app/is_loading_provider.dart';
import 'package:sales_counter/ui/provider/app/settings_provider.dart';
import 'package:sales_counter/ui/screen/home/home_presenter.dart';

class HomeScreenWidget extends ConsumerWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDownloaded = ref.watch(isLoadingProvider);
    if (isDownloaded) {
      return const _HomeScreenWidget();
    } else {
      return const _LoadHomeScreenWidget();
    }
  }
}

class _HomeScreenWidget extends ConsumerWidget {
  const _HomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSeller = ref.watch(settingsProvider).seller;
    final Widget bodyWidget;
    if (isSeller) {
      bodyWidget = const _BodySellerHomeScreenWidget();
    } else {
      bodyWidget = const _BodyClientHomeScreenWidget();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.titleHomeAppBar),
      ),
      body: bodyWidget,
    );
  }
}

class _BodyClientHomeScreenWidget extends StatelessWidget {
  const _BodyClientHomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _ForClientHomeScreenWidget();
  }
}

class _BodySellerHomeScreenWidget extends StatelessWidget {
  const _BodySellerHomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _ForClientHomeScreenWidget extends ConsumerWidget {
  const _ForClientHomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenterNotifier = ref.read(homePresenter.notifier);
    final presenterState = ref.read(homePresenter);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrettyQr(
            size: 300,
            data: presenterNotifier.getClientCardData(),
          ),
          if (kDebugMode) Text('id: ${presenterState.userID}') else const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _LoadHomeScreenWidget extends StatelessWidget {
  const _LoadHomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

final homePresenter = StateNotifierProvider.autoDispose<HomePresenterNotifier, HomeState>(HomePresenterNotifier.new);
