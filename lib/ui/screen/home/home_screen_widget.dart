import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:sales_counter/core/localized/generated/l10n.dart';
import 'package:sales_counter/core/resources/app_assets.dart';
import 'package:sales_counter/core/resources/app_text_style.dart';
import 'package:sales_counter/ui/provider/app/is_loading_provider.dart';
import 'package:sales_counter/ui/provider/app/sales_provider.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.homeTitleSellerAppBar),
        excludeHeaderSemantics: true,
        actions: [
          IconButton(
            tooltip: S.current.homeButtonSettings,
            onPressed: presenter.goSettingsScreen,
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const _BodySellerHomeScreenWidget(),
      floatingActionButton: FloatingActionButton(
        tooltip: S.current.homeSemanticLabelButtonScan,
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
        title: Text(S.current.homeTitleClientAppBar),
        excludeHeaderSemantics: true,
        actions: [
          IconButton(
            onPressed: presenter.goSettingsScreen,
            icon: const Icon(Icons.settings),
            tooltip: S.current.homeTitleClientAppBar,
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
    return Semantics.fromProperties(
      properties: const SemanticsProperties(
        label: 'Bottom navigation bar',
        enabled: true,
      ),
      child: BottomNavigationBar(
        enableFeedback: true,
        items: [
          BottomNavigationBarItem(
            tooltip: S.current.homeSemanticLabelButtonClientCard,
            activeIcon: const Icon(Icons.person, size: 32),
            icon: const Icon(Icons.person, size: 22),
            label: S.current.homeTitleClientAppBar,
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            tooltip: S.current.homeSemanticLabelScreenSales,
            activeIcon: const Icon(Icons.business, size: 32),
            icon: const Icon(Icons.business, size: 22),
            label: S.current.homeTitleSellerAppBar,
            //backgroundColor: Colors.green,
          ),
        ],
        currentIndex: indexPage,
        onTap: presenter.changeIndexPage,
      ),
    );
  }
}

class _BodyClientHomeScreenWidget extends ConsumerWidget {
  const _BodyClientHomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final settingsNotifier = ref.watch(settingsProvider.notifier);
    return Semantics.fromProperties(
      properties: SemanticsProperties(label: S.current.homeSemanticLabelScreenClientCard),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Semantics.fromProperties(
              properties: SemanticsProperties(label: S.current.homeSemanticLabelQRCode),
              child: PrettyQr(
                image: const AssetImage(AppAssets.imagesLogo),
                roundEdges: true,
                size: 300,
                data: settingsNotifier.getJsonDataBarcode(),
              ),
            ),
            if (kDebugMode)
              Text(
                'id: ${settings.userId}',
                semanticsLabel: 'id',
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class _BodySellerHomeScreenWidget extends ConsumerWidget {
  const _BodySellerHomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesUserID = ref.watch(salesProvider.select((value) => value.userID));
    final salesCount = ref.watch(salesProvider.select((value) => value.count));
    final stateHome = ref.watch(homeScreenPresenter);
    final presenter = ref.read(homeScreenPresenter.notifier);
    if (stateHome.indexPage == 0) {
      return const _BodyClientHomeScreenWidget();
    } else {
      return Semantics.fromProperties(
        properties: SemanticsProperties(label: S.current.homeSemanticLabelScreenSales),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'id:$salesUserID',
              semanticsLabel: 'id',
            ),
            const SizedBox(height: 10),
            Text(
              '${S.current.homeDisplayName}:${stateHome.userName}',
              style: AppTextStyle.bold24TextStyle,
              semanticsLabel: S.current.homeDisplayName,
            ),
            const SizedBox(height: 10),
            Text(
              '${S.current.homeDisplayEMail}:${stateHome.userEmail}',
              style: AppTextStyle.bold16TextStyle,
              semanticsLabel: S.current.homeDisplayEMail,
            ),
            const SizedBox(height: 10),
            Text(
              '${S.current.homeDisplayCount}:$salesCount',
              style: AppTextStyle.bold32TextStyle,
              semanticsLabel: S.current.homeDisplayCount,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              height: 60,
              child: Semantics.fromProperties(
                properties: SemanticsProperties(label: S.current.homeButtonAddSales),
                child: ElevatedButton(
                  onPressed: presenter.addSale,
                  child: Text(
                    S.current.homeButtonAddSales,
                    style: AppTextStyle.bold24TextStyle,
                  ),
                ),
              ),
            ),
          ],
        )),
      );
    }
  }
}

class _LoadHomeScreenWidget extends StatelessWidget {
  const _LoadHomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics.fromProperties(
      properties: SemanticsProperties(label: S.current.homeSemanticLabelLoad),
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            semanticsLabel: S.current.homeSemanticLabelLoad,
          ),
        ),
      ),
    );
  }
}

final homeScreenPresenter =
    StateNotifierProvider.autoDispose<HomeScreenPresenterNotifier, HomeScreenState>(HomeScreenPresenterNotifier.new);
