import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sales_counter/data/source/i_secure_storage_source.dart';

enum PlatformApp { isAndroid, isOS, isWeb }

class SecureStorageSource extends ISecureStorageSource {
  final FlutterSecureStorage _storage;
  late final PlatformApp platform;

  SecureStorageSource() : _storage = const FlutterSecureStorage() {
    try {
      platform = Platform.isAndroid ? PlatformApp.isAndroid : PlatformApp.isOS;
    } catch (e) {
      platform = PlatformApp.isWeb;
    }
  }

  @override
  void write(String key, String value) {
    switch (platform) {
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
  Future<String?> read(String key) async {
    switch (platform) {
      case PlatformApp.isAndroid:
        return _storage.read(
          key: key,
          aOptions: _getAndroidOptions(),
        );
      default:
        return _storage.read(
          key: key,
          iOptions: _getIOSOptions(),
        );
    }
  }

  IOSOptions _getIOSOptions() => const IOSOptions(accountName: 'q_cabinet');

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        preferencesKeyPrefix: 'q_cabinet',
      );

  @override
  void dispose() {}

  @override
  void init() {}
}
