import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/domain/use_case/sales/read_sales_use_case.dart';
import 'package:sales_counter/ui/provider/repository/local_storages_repository_provider.dart';

final readSalesUseCaseProvider = Provider<ReadSalesUseCase>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return ReadSalesUseCase(localStorageRepository: localStorageRepository);
});
