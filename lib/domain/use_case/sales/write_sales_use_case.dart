import 'package:sales_counter/domain/entity/data/i_sales.dart';
import 'package:sales_counter/domain/repository/i_local_storage_repository.dart';
import 'package:sales_counter/domain/use_case/i_use_case.dart';

class WriteSalesUseCase extends IUseCaseReturnVoidArgumentType<ISales> {
  final ILocalStorageRepository localStorageRepository;

  WriteSalesUseCase({
    required this.localStorageRepository,
  });

  @override
  void call(ISales argument) {
    localStorageRepository.writeData(argument);
  }
}
