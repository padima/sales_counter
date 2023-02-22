import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/core/localized/generated/l10n.dart';
import 'package:sales_counter/core/resources/app_theme.dart';
import 'package:sales_counter/ui/navigator/main_navigator.dart';

class SalesCounterApp extends ConsumerWidget {
  const SalesCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(mainNavigatorProvider);
    final appTheme = ref.read(appThemeProvider).tempTheme;
    return MaterialApp.router(
      title: 'Sales counter App',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: appTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
