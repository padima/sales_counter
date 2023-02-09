import 'dart:developer';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/sales_counter_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.toString());
    FlutterError.presentError(details);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    log('Error: ${error.toString()}, stack: ${stack.toString()}');
    return true;
  };
  runApp(
    const ProviderScope(
      child: SalesCounterApp(),
    ),
  );
  GestureBinding.instance.resamplingEnabled = true;
}
