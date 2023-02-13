import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/data/repository/local_storage_repository.dart';
import 'package:sales_counter/data/source/hive_storage_sources.dart';
import 'package:sales_counter/domain/repository/i_local_storage_repository.dart';

final localStorageRepositoryProvider = Provider<ILocalStorageRepository>((ref) {
  final source = HiveStorageSources();
  return LocalStorageRepository(source);
});
