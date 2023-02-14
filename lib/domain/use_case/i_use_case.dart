abstract class IUseCase {}

// ignore: one_member_abstracts
abstract class IUseCaseReturnTypeArgumentType<ReturnType, ArgumentType> extends IUseCase {
  ReturnType call(ArgumentType argument);
}

// ignore: one_member_abstracts
abstract class IUseCaseReturnTypeNoArgument<ReturnType> extends IUseCase {
  ReturnType call();
}

// ignore: one_member_abstracts
abstract class IUseCaseNoArgumentReturnVoid extends IUseCase {
  void call();
}

// ignore: one_member_abstracts
abstract class IUseCaseReturnVoidArgumentType<ArgumentType> extends IUseCase {
  void call(ArgumentType argument);
}
