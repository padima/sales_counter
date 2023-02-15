import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_counter/domain/use_case/sales/write_sales_use_case.dart';
import 'package:sales_counter/ui/provider/repository/local_storages_repository_provider.dart';

final writeSalesUseCaseProvider = Provider<WriteSalesUseCase>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return WriteSalesUseCase(localStorageRepository: localStorageRepository);
});
