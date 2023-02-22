import 'dart:developer';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/ui/sales_counter_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    assert(() {
      log(
        'FlutterError.onError:$details',
        error: details.exception,
        stackTrace: details.stack,
      );
      return true;
    }());
    FlutterError.presentError(details);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    assert(() {
      log(
        'PlatformDispatcher.instance.onError:$error',
        error: error,
        stackTrace: stack,
      );
      return true;
    }());
    return true;
  };
  runApp(
    const ProviderScope(
      child: SalesCounterApp(),
    ),
  );
  GestureBinding.instance.resamplingEnabled = true;
}
