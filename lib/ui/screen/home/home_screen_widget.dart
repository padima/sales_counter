import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:sales_counter/core/localized/generated/l10n.dart';
import 'package:sales_counter/core/resources/app_assets.dart';
import 'package:sales_counter/ui/provider/app/is_loading_provider.dart';
import 'package:sales_counter/ui/provider/app/settings_provider.dart';
import 'package:sales_counter/ui/screen/home/home_presenter.dart';

class HomeScreenWidget extends ConsumerWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDownloaded = ref.watch(isLoadingProvider);
    ref.listen(settingsProvider, (previous, next) {
      if (previous != null && !previous.seller && next.seller) {
        ref.read(isLoadingProvider.notifier).reload();
      }
    });
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
    final isSeller = ref.watch(settingsProvider.select((value) => value.seller));
    if (isSeller) {
      return const _HomeScreenSellerWidget();
    } else {
      return const _HomeScreenClientWidget();
    }
  }
}

class _HomeScreenSellerWidget extends ConsumerWidget {
  const _HomeScreenSellerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(homeScreenPresenter.notifier);
    ref.listen(homeScreenPresenter, (previous, next) {
      if (previous?.barcodeScan != next.barcodeScan) {
        ref.read(homeScreenPresenter.notifier).readSalesData();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.titleHomeSellerAppBar),
        actions: [
          IconButton(
            onPressed: presenter.goSettingsScreen,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const _BodySellerHomeScreenWidget(),
      floatingActionButton: FloatingActionButton(
        child: const Center(
          child: Icon(Icons.qr_code_scanner, size: 38),
        ),
        onPressed: presenter.getBarcode,
      ),
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}

class _HomeScreenClientWidget extends ConsumerWidget {
  const _HomeScreenClientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(homeScreenPresenter.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.titleHomeClientAppBar),
        actions: [
          IconButton(
            onPressed: presenter.goSettingsScreen,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const _BodyClientHomeScreenWidget(),
    );
  }
}

class _BottomNavigationBar extends ConsumerWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexPage = ref.watch(homeScreenPresenter.select((value) => value.indexPage));
    final presenter = ref.watch(homeScreenPresenter.notifier);
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          activeIcon: const Icon(Icons.person, size: 32),
          icon: const Icon(Icons.person, size: 22),
          label: S.current.titleHomeClientAppBar,
          //backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          activeIcon: const Icon(Icons.business, size: 32),
          icon: const Icon(Icons.business, size: 22),
          label: S.current.titleHomeSellerAppBar,
          //backgroundColor: Colors.green,
        ),
      ],
      currentIndex: indexPage,
      onTap: presenter.changeIndexPage,
    );
  }
}

class _BodyClientHomeScreenWidget extends ConsumerWidget {
  const _BodyClientHomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final presenter = ref.read(homeScreenPresenter.notifier);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrettyQr(
            image: const AssetImage(AppAssets.imagesLogo),
            roundEdges: true,
            size: 300,
            data: presenter.getClientCardData(),
          ),
          if (kDebugMode) Text('id: ${settings.userId}') else const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _BodySellerHomeScreenWidget extends ConsumerWidget {
  const _BodySellerHomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexPage = ref.watch(homeScreenPresenter.select((value) => value.indexPage));
    final sales = ref.watch(homeScreenPresenter.select((value) => value.sales));
    if (indexPage == 0) {
      return const Semantics.fromProperties(
        child: _BodyClientHomeScreenWidget(),
        properties: SemanticsProperties(label: 'Client card screen.'),
      );
    } else {
      return const Semantics.fromProperties(
        child: Placeholder(),
        properties: SemanticsProperties(label: 'Sales screen.'),
      );
    }
  }
}

class _LoadHomeScreenWidget extends StatelessWidget {
  const _LoadHomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Load app screen.',
        readOnly: true,
      ),
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

final homeScreenPresenter =
    StateNotifierProvider.autoDispose<HomeScreenPresenterNotifier, HomeScreenState>(HomeScreenPresenterNotifier.new);
