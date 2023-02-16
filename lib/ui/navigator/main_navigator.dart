import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sales_counter/core/resources/app_routes.dart';
import 'package:sales_counter/ui/provider/repository/navigator_key_provider.dart';
import 'package:sales_counter/ui/screen/home/home_screen_widget.dart';
import 'package:sales_counter/ui/screen/settings/settings_screen_widget.dart';

class _MainNavigator extends ChangeNotifier {
  _MainNavigator(this._ref);

  final Ref _ref;

  final _routes = [
    GoRoute(
      path: AppRoutes.screenHome,
      routes: [
        GoRoute(
          path: AppRoutes.screenSettings,
          pageBuilder: (context, state) => _buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const SettingsScreenWidget(),
          ),
        ),
      ],
      pageBuilder: (context, state) {
        return _buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const HomeScreenWidget(),
        );
      },
    ),
  ];

  FutureOr<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    return null;
  }

  static CustomTransitionPage _buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.ease);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: child,
        );
      },
    );
  }
}

final mainNavigatorProvider = Provider<GoRouter>(
  (ref) {
    final router = _MainNavigator(ref);
    return GoRouter(
      navigatorKey: ref.watch(navigatorKeyProvider),
      initialLocation: AppRoutes.screenHome,
      debugLogDiagnostics: true,
      refreshListenable: router,
      routes: router._routes,
      redirect: router._redirect,
    );
  },
);
