import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:sales_counter/data/model/sales_model.dart';
import 'package:sales_counter/data/repository/local_storage_repository.dart';
import 'package:sales_counter/data/source/hive_storage_sources.dart';

void main() {
  group(
    'LocalStorageRepository',
    () {
      test(
        'read/write',
        () async {
          await setUpTestHive();
          final source = HiveStorageSources();
          final localStorageRepository = LocalStorageRepository(source);
          final settings = <String, dynamic>{
            'openBox': <String>[
              'sales',
            ],
          };
          await source.openStorage(settings: settings);
          //await localStorageRepository.init();
          const testData = SalesModel(
            userID: '123456',
            count: 10,
          );
          localStorageRepository.writeData(testData);
          final result = localStorageRepository.readData(testData.userID);
          await tearDownTestHive();
          expect(result, testData);
        },
      );
    },
  );
}
