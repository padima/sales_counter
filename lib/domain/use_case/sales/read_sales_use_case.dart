import 'package:sales_counter/domain/entity/data/i_sales.dart';
import 'package:sales_counter/domain/repository/i_local_storage_repository.dart';
import 'package:sales_counter/domain/use_case/i_use_case.dart';

class ReadSalesUseCase extends IUseCaseReturnTypeArgumentType<ISales, String> {
  final ILocalStorageRepository localStorageRepository;

  ReadSalesUseCase({
    required this.localStorageRepository,
  });

  @override
  ISales call(String argument) {
    return localStorageRepository.readData(argument);
  }
}
