// ignore: one_member_abstracts
abstract class IUseCase<T, P> {
  T call(P argument);
}
