import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/core/resources/app_colors.dart';

class _AppTheme {
  _AppTheme();

  final tempTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.primaryColors,
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryColors,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.primaryTextColors,
        fontSize: 24,
      ),
    ),
  );
}

final appThemeProvider = Provider<_AppTheme>((ref) => _AppTheme());
