import 'dart:developer';

import 'package:sales_counter/core/resources/app_exception.dart';
import 'package:sales_counter/data/model/sales_model.dart';
import 'package:sales_counter/data/source/i_local_storage_source.dart';
import 'package:sales_counter/domain/entity/data/i_sales.dart';
import 'package:sales_counter/domain/repository/i_local_storage_repository.dart';

class LocalStorageRepository extends ILocalStorageRepository {
  final ILocalStorageSource source;

  LocalStorageRepository(this.source);

  @override
  Future<void> dispose() async {
    try {
      await source.dispose();
    } catch (error, stackTrace) {
      assert(() {
        log(
          'Error:$error',
          error: error,
          stackTrace: stackTrace,
        );
        return true;
      }());
    }
  }

  @override
  Future<void> init() async {
    try {
      await source.init();
      final settings = <String, dynamic>{
        'openBox': <String>[
          'sales',
        ],
      };
      await source.openStorage(settings: settings);
    } catch (error, stackTrace) {
      assert(() {
        log(
          'Error:$error',
          error: error,
          stackTrace: stackTrace,
        );
        return true;
      }());
    }
  }

  @override
  ISales readData(String key) {
    try {
      final result = SalesModel.fromMap(
        source.readStorageData(
          storageName: 'sales',
          key: key,
        ),
      );
      return result;
    } on NullReturnException {
      return SalesModel.emptyClient(key);
    } on NotOpenedStorageException catch (error, stackTrace) {
      assert(() {
        log(
          'Error:$error',
          error: error,
          stackTrace: stackTrace,
        );
        return true;
      }());
      return SalesModel.emptyClient(key);
    } catch (error, stackTrace) {
      assert(() {
        log(
          'Error:$error',
          error: error,
          stackTrace: stackTrace,
        );
        return true;
      }());
      return SalesModel.emptyClient(key);
    }
  }

  @override
  void writeData(ISales sales) {
    try {
      source.writeStorageData(
        storageName: 'sales',
        key: sales.userID,
        values: sales.toMap(),
      );
    } catch (error, stackTrace) {
      assert(() {
        log(
          'Error:$error',
          error: error,
          stackTrace: stackTrace,
        );
        return true;
      }());
    }
  }
}
