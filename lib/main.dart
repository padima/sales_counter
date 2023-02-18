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
      observers: [
        Logger(),
      ],
      child: SalesCounterApp(),
    ),
  );
  GestureBinding.instance.resamplingEnabled = true;
}

class Logger extends ProviderObserver {
  const Logger();

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    assert(() {
      log('didAddProvider:${provider.name ?? provider.runtimeType}, value:$value');
      return true;
    }());
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    assert(() {
      log('didDisposeProvider:${provider.name ?? provider.runtimeType}');
      return true;
    }());
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    assert(() {
      log('didUpdateProvider:${provider.name ?? provider.runtimeType}, previousValue:$previousValue, newValue:$newValue');
      return true;
    }());
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    assert(() {
      log('providerDidFail:${provider.name ?? provider.runtimeType}, error:$error, stackTrace:$stackTrace');
      return true;
    }());
  }
}
