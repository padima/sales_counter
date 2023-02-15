import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sales_counter/core/resources/app_exception.dart';
import 'package:sales_counter/data/source/i_secure_storage_source.dart';

enum PlatformApp { isAndroid, isOS, isWeb }

class SecureStorageSource extends ISecureStorageSource {
  late final FlutterSecureStorage _storage;
  late final PlatformApp _platform;

  SecureStorageSource() {
    try {
      _platform = Platform.isAndroid ? PlatformApp.isAndroid : PlatformApp.isOS;
    } catch (e) {
      _platform = PlatformApp.isWeb;
    }
    _storage = FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
      webOptions: _getWebOptions(),
    );
  }

  @override
  void writeData(String key, String value) {
    _storage.write(
      key: key,
      value: value,
    );
  }

  @override
  Future<String> readData(String key) async {
    final result = await _storage.read(
      key: key,
    );
    if (result == null) throw NullReturnException();
    return result;
  }

  IOSOptions _getIOSOptions() {
    return const IOSOptions(accountName: 'sales_counter');
  }

  AndroidOptions _getAndroidOptions() {
    return const AndroidOptions(
      encryptedSharedPreferences: true,
    );
  }

  WebOptions _getWebOptions() {
    return const WebOptions(
      dbName: 'sales_counter',
      publicKey: 'sales_counter',
    );
  }

  @override
  void dispose() {}

  @override
  void init() {}
}
