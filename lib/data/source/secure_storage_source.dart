import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sales_counter/core/resources/app_exception.dart';
import 'package:sales_counter/data/source/i_secure_storage_source.dart';

enum PlatformApp { isAndroid, isOS, isWeb }

class SecureStorageSource extends ISecureStorageSource {
  final FlutterSecureStorage _storage;
  late final PlatformApp _platform;

  SecureStorageSource() : _storage = const FlutterSecureStorage() {
    try {
      _platform = Platform.isAndroid ? PlatformApp.isAndroid : PlatformApp.isOS;
    } catch (e) {
      _platform = PlatformApp.isWeb;
    }
  }

  @override
  void write(String key, String value) {
    switch (_platform) {
      case PlatformApp.isAndroid:
        _storage.write(
          key: key,
          value: value,
          aOptions: _getAndroidOptions(),
        );
        break;
      default:
        _storage.write(
          key: key,
          value: value,
          iOptions: _getIOSOptions(),
        );
    }
  }

  @override
  Future<String> read(String key) async {
    final result = await _storage.read(
      key: key,
      aOptions: _platform == PlatformApp.isAndroid ? _getAndroidOptions() : null,
      iOptions: _platform == PlatformApp.isOS ? _getIOSOptions() : null,
      webOptions: _platform == PlatformApp.isWeb ? _getWebOptions() : null,
    );
    if (result == null) throw NullReturnException();
    return result;
  }

  IOSOptions _getIOSOptions() => const IOSOptions(accountName: 'sales_counter');

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        preferencesKeyPrefix: 'sales_counter',
      );

  WebOptions _getWebOptions() => const WebOptions(
        dbName: 'sales_counter',
        publicKey: 'sales_counter',
      );

  @override
  void dispose() {}

  @override
  void init() {}
}
